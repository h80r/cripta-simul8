import 'creature.dart';
import 'enums/ia.dart';

class Monster extends Creature {
  final IA ia;

  Monster({
    required super.name,
    required super.maxHP,
    required super.attackBonus,
    required super.range,
    required super.speed,
    required this.ia,
  });
}
