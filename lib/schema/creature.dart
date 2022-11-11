import 'dart:math';

import 'package:cripta_simul8/dice.dart';

class Creature {
  final String name;
  final int maxHP;
  final int attackBonus;
  final int range;
  final int speed;

  int _currentHP;

  Creature({
    required this.name,
    required this.maxHP,
    required this.attackBonus,
    required this.range,
    required this.speed,
  }) : _currentHP = maxHP;

  bool get isAlive => _currentHP > 0;
  bool get isHurt => _currentHP < 0.3 * maxHP;

  int attack() => rollDie() + attackBonus;
  void getHealed(int amount) => _currentHP = min(_currentHP + amount, maxHP);
  void takeDamage(int damage) => _currentHP = max(_currentHP - damage, 0);
}


// name ✅
// hp 
// attack ✅
// range 
// speed ✅