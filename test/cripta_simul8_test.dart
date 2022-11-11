import 'package:cripta_simul8/const/heroes.dart';
import 'package:cripta_simul8/cripta_simul8.dart';
import 'package:cripta_simul8/deck.dart';
import 'package:cripta_simul8/schema/item.dart';
import 'package:cripta_simul8/schema/monster.dart';
import 'package:test/test.dart';

void main() {
  test('Green Deck', () {
    // arrange
    const attempts = 1000;
    final deck = greenDeck();
    final items = deck
        .takeWhile(
          (value) => value is Item,
        )
        .toList()
        .cast<Item>();
    final monster = deck.firstWhere(
      (element) => element is! Item,
    ) as Monster Function();

    genHeroes() => [createArcher()];
    genMonsters(int n) => List.generate(n, (_) => monster());
    genItems() => [...items];

    // act
    final results = List.generate(
          attempts,
          (_) {
            final heroes = genHeroes();
            return willHeroesWin(
              heroes,
              genMonsters(heroes.length),
              genItems(),
            );
          },
        ).fold(
            0, (previousValue, element) => previousValue + (element ? 1 : 0)) /
        attempts;

    // assert
    expect(results, inInclusiveRange(0.4, 0.6));
  });
}
