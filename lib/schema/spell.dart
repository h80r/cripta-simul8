import 'package:cripta_simul8/dice.dart';

import 'enums/target.dart';
import 'origin.dart';

class Spell {
  final int damageInDice;
  final int rangeInTiles;
  final Origin origin;
  final Target target;

  const Spell({
    required this.damageInDice,
    required this.rangeInTiles,
    required this.origin,
    required this.target,
  });

  int get damage => rollDie(damageInDice);
}
