import 'dart:math';

int rollDie([int dieCount = 1, int dieSides = 6]) =>
    List.generate(dieCount, (index) => Random().nextInt(dieSides) + 1)
        .reduce((value, element) => value + element);
