class Origin {
  const Origin();
}

class FromHero extends Origin {
  const FromHero();
}

class FromArea extends Origin {
  final int rangeInTiles;

  const FromArea({required this.rangeInTiles}) : super();
}
