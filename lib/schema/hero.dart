import 'dart:math';

import 'package:cripta_simul8/schema/creature.dart';
import 'package:cripta_simul8/schema/spell.dart';

class Hero extends Creature {
  Hero({
    required super.name,
    required super.maxHP,
    required super.attackBonus,
    required super.range,
    required super.speed,
  });
}

class Talented extends Hero {
  final List<Spell> spells;
  final double spellChange;

  Talented({
    required super.name,
    required super.maxHP,
    required super.attackBonus,
    required super.range,
    required super.speed,
    required this.spells,
    required this.spellChange,
  });

  Spell castSpell() {
    return spells[Random().nextInt(spells.length)];
  }
}
