import 'target.dart';
import '../origin.dart';
import '../spell.dart';

enum SpellList {
  lightningBolt(
    Spell(
      damageInDice: 1,
      rangeInTiles: 6,
      origin: FromHero(),
      target: Target.line,
    ),
  ),
  fireball(
    Spell(
      damageInDice: 2,
      rangeInTiles: 5,
      origin: FromArea(rangeInTiles: 6),
      target: Target.radius,
    ),
  ),
  magicMissile(
    Spell(
      damageInDice: 1,
      rangeInTiles: 16,
      origin: FromHero(),
      target: Target.multiple,
    ),
  ),
  heal(
    Spell(
      damageInDice: 1,
      rangeInTiles: 1,
      origin: FromHero(),
      target: Target.touch,
    ),
  ),
  smite(
    Spell(
      damageInDice: 2,
      rangeInTiles: 1,
      origin: FromHero(),
      target: Target.touch,
    ),
  );

  final Spell spell;

  const SpellList(this.spell);
}
