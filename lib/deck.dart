import 'dart:math';

import 'package:cripta_simul8/const/items.dart';
import 'package:cripta_simul8/const/monsters.dart';

import 'schema/item.dart';

enum DeckLevel {
  green,
  orange,
  red,
}

Item getItem(DeckLevel lvl) {
  final rng = Random();

  switch (lvl) {
    case DeckLevel.green:
      return greenItems[rng.nextInt(greenItems.length)];
    case DeckLevel.orange:
      return orangeItems[rng.nextInt(orangeItems.length)];
    case DeckLevel.red:
      return redItems[rng.nextInt(redItems.length)];
  }
}

List greenDeck() {
  final res = <dynamic>[createGoblin, createWolf, createSkeleton];
  for (var i = 0; i < 6; i++) {
    res.add(getItem(DeckLevel.green));
  }
  return res..shuffle();
}

List orangeDeck() {
  final res = <dynamic>[
    createGoblin,
    createWolf,
    createSkeleton,
    createGiant,
    createMinotaur,
    createDragon,
  ];
  for (var i = 0; i < 3; i++) {
    res.add(getItem(DeckLevel.green));
    res.add(getItem(DeckLevel.orange));
  }
  return res..shuffle();
}

List redDeck() {
  final res = <dynamic>[createKumon];
  for (var i = 0; i < 3; i++) {
    res.add(getItem(DeckLevel.green));
    res.add(getItem(DeckLevel.red));
  }
  return res..shuffle();
}
