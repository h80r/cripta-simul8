import '../schema/item.dart';

const greenItems = [smallPotion, impetusPotion, furyPotion];
const orangeItems = [chest, map, bigPotion];
const redItems = [phoenixFeather, dragonFire];

// Green Items
const smallPotion = Item(
  title: 'Poção Pequena',
  description: 'Usuário recupera 1d, aliados recuperam 1.',
);

const furyPotion = Item(
  title: 'Tônico de Fúria',
  description: 'Usuário recebe +2 atk até seu próximo turno',
);

const impetusPotion = Item(
  title: 'Tônico de Ímpeto',
  description: 'Usuário recebe +2 Spd até seu próximo turno',
);

// Orange Items
const chest = Item(
  title: 'Baú',
  description: 'Procure no baralho por uma carta de item',
);

const map = Item(
  title: 'Mapa',
  description: 'Você pode ignorar o próximo monstro',
);

const bigPotion = Item(
  title: 'Poção Grande',
  description: 'Usuário recupera 2d, aliados recuperam 2.',
);

// Red Items
const phoenixFeather = Item(
  title: 'Pena de Fênix',
  description: 'Herói caído levanta-se com vida cheia.',
);

const dragonFire = Item(
  title: 'Fogo de Dragão',
  description: 'Causa 1d de dano à criatura alvo',
);
