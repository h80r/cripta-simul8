import 'package:cripta_simul8/schema/monster.dart';
import '../schema/enums/ia.dart';

// Green Monsters
Monster createGoblin() {
  return Monster(
    name: 'Goblin',
    maxHP: 6,
    attackBonus: 0,
    range: 1,
    speed: 5,
    ia: IA.closest,
  );
}

Monster createWolf() {
  return Monster(
    name: 'Lobo',
    maxHP: 10,
    attackBonus: 0,
    range: 1,
    speed: 6,
    ia: IA.closest,
  );
}

Monster createSkeleton() {
  return Monster(
    name: 'Esqueleto',
    maxHP: 6,
    attackBonus: 1,
    range: 1,
    speed: 4,
    ia: IA.closest,
  );
}

// Orange Monsters
Monster createGiant() {
  return Monster(
    name: 'Gigante',
    maxHP: 24,
    attackBonus: 2,
    range: 1,
    speed: 4,
    ia: IA.closest,
  );
}

Monster createMinotaur() {
  return Monster(
    name: 'Minotauro',
    maxHP: 18,
    attackBonus: 2,
    range: 1,
    speed: 5,
    ia: IA.wounded,
  );
}

Monster createDragon() {
  return Monster(
    name: 'Dragão',
    maxHP: 20,
    attackBonus: 2,
    range: 2,
    speed: 5,
    ia: IA.wounded,
  );
}

// Red Monster
Monster createKumon() {
  return Monster(
    name: 'Kumon',
    maxHP: 18,
    attackBonus: 2,
    range: 4,
    speed: 4,
    ia: IA.wounded,
  );
}
