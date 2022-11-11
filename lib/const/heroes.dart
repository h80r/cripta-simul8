import 'package:cripta_simul8/schema/hero.dart';

import '../schema/enums/spell_list.dart';

Hero createWarrior() {
  return Hero(
    name: 'Guerreiro',
    maxHP: 14,
    attackBonus: 3,
    range: 1,
    speed: 6,
  );
}

Hero createBarbarian() {
  return Hero(
    name: 'Bárbaro',
    maxHP: 16,
    attackBonus: 4,
    range: 1,
    speed: 4,
  );
}

Hero createPaladin() {
  return Talented(
    name: 'Paladino',
    maxHP: 12,
    attackBonus: 2,
    range: 1,
    speed: 6,
    spells: [SpellList.smite.spell],
    spellChange: 0.5,
  );
}

Hero createArcher() {
  return Hero(
    name: 'Arqueiro',
    maxHP: 12,
    attackBonus: 1,
    range: 4,
    speed: 7,
  );
}

Hero createMage() {
  return Talented(
    name: 'Mago',
    maxHP: 8,
    attackBonus: 0,
    range: 1,
    speed: 5,
    spells: [
      SpellList.lightningBolt.spell,
      SpellList.fireball.spell,
      SpellList.magicMissile.spell,
    ],
    spellChange: 0.8,
  );
}
