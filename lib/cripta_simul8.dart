import 'dart:math';

import 'schema/creature.dart';
import 'schema/hero.dart';
import 'schema/item.dart';
import 'schema/monster.dart';
import 'schema/enums/spell_list.dart';

bool willHeroesWin(
  List<Hero> heroes,
  List<Monster> monsters,
  List<Item> items,
) {
  final rng = Random();
  final deadHeroes = <Hero>[];
  while (heroes.isNotEmpty && monsters.isNotEmpty) {
    for (var hero in heroes) {
      if (monsters.isEmpty) break;

      if (items.isNotEmpty && rng.nextBool()) {
        _itemFlow(hero, heroes, deadHeroes, monsters, items);
        _removeDead(monsters);
      }

      if (hero is Talented) {
        _talentedFlow(hero, heroes, monsters);
      } else {
        _heroFlow(hero, monsters);
      }

      _removeDead(monsters);
    }

    for (var monster in monsters) {
      if (heroes.isEmpty) break;
      _getTargets(maxTargets: 1, creatures: heroes)
          .first
          .takeDamage(monster.attack());
      deadHeroes.addAll(_removeDead(heroes).cast());
    }
  }

  return heroes.isNotEmpty;
}

void _itemFlow(
  Hero hero,
  List<Hero> heroes,
  List<Hero> deadHeroes,
  List<Monster> monsters,
  List<Item> items,
) {
  final rng = Random();
  final item = items.removeAt(rng.nextInt(items.length));
  switch (item.title) {
    case 'Poção Pequena':
      hero.getHealed(rng.nextInt(6) + 1);
      heroes.where((e) => e != hero).forEach((e) => e.getHealed(1));
      break;
    case 'Poção Grande':
      hero.getHealed(rng.nextInt(6) + rng.nextInt(6) + 2);
      heroes.where((e) => e != hero).forEach((e) => e.getHealed(2));
      break;
    case 'Pena de Fênix':
      final res = ([...deadHeroes]..shuffle()).first;
      res.getHealed(88);
      heroes.add(res);
      deadHeroes.remove(res);
      break;
    case 'Fogo de Dragão':
      _getTargets(creatures: monsters, maxTargets: 1).forEach(
        (c) => c.takeDamage(rng.nextInt(6) + 1),
      );
      break;
  }
}

void _talentedFlow(Talented hero, List<Hero> heroes, List<Monster> monsters) {
  final others = heroes.where((h) => h != hero).toList();
  final needsHealing = others.where((h) => h.isHurt).toList();
  if (needsHealing.isNotEmpty) {
    final target = _getTargets(maxTargets: 1, creatures: needsHealing).first;
    target.getHealed(SpellList.heal.spell.damage);
    return;
  }

  if (Random().nextDouble() <= hero.spellChange) {
    _spellFlow(hero, monsters);
    return;
  }

  _heroFlow(hero, monsters);
}

void _spellFlow(Talented hero, List<Monster> monsters) {
  final spell = hero.castSpell();

  if (spell == SpellList.lightningBolt.spell) {
    _getTargets(
      maxTargets: 3,
      creatures: monsters,
    ).forEach((t) => t.takeDamage(spell.damage));
  } else if (spell == SpellList.fireball.spell) {
    _getTargets(
      minTargets: 2,
      maxTargets: 3,
      creatures: monsters,
    ).forEach((t) => t.takeDamage(spell.damage));
  } else if (spell == SpellList.magicMissile.spell) {
    final targets = _getTargets(maxTargets: 3, creatures: monsters);
    switch (targets.length) {
      case 2:
        targets[0].takeDamage(spell.damage);
        targets[1].takeDamage(_getSpellDamage(2, () => spell.damage));
        break;
      default:
        for (var t in targets) {
          t.takeDamage(_getSpellDamage(
            3 ~/ targets.length,
            () => spell.damage,
          ));
        }
        break;
    }
  }
}

void _heroFlow(Hero hero, List<Monster> monsters) =>
    _getTargets(maxTargets: 1, creatures: monsters)
        .first
        .takeDamage(hero.attack());

List<Creature> _getTargets({
  int minTargets = 1,
  required int maxTargets,
  required List<Creature> creatures,
}) =>
    ([...creatures]..shuffle()).sublist(
      0,
      min(
        Random().nextInt(maxTargets) + minTargets,
        creatures.length,
      ),
    );

int _getSpellDamage(int hitTimes, int Function() damage) =>
    List.generate(hitTimes, (i) => damage()).reduce(
      (a, b) => a + b,
    );

List<Creature> _removeDead(List<Creature> creatures) {
  final dead = creatures.where((c) => !c.isAlive).toList();
  creatures.removeWhere((c) => !c.isAlive);
  return dead;
}
