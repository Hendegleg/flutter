import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "classic cheese bruger",
      description:
          "C'est un sandwich composé d'un steak haché, de fromage fondu entre deux pains à hamburger.",
      imagePath: "lib/images/burgers/a.jpg",
      price: 15,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Supplément fromage", price: 3),
        Addon(name: "Bacon", price: 4),
        Addon(name: "Avocat", price: 5),
      ],
    ),
    Food(
      name: "BBQ Bacon Burger",
      description:
          "Un délicieux hamburger avec un steak juteux, du fromage fondu et du bacon croustillant, le tout dans un pain moelleux.",
      imagePath: "lib/images/burgers/B.jpg",
      price: 8,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Double portion de fromage", price: 7),
        Addon(name: "Oignons caramélisés", price: 6),
        Addon(name: "Champignons sautés", price: 5),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "Un burger végétarien savoureux avec un steak de légumes grillés et du fromage fondant, le tout dans un pain croustillant.",
      imagePath: "lib/images/burgers/c.jpg",
      price: 7,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Double portion de fromage", price: 6),
        Addon(name: "Aubergine grillée", price: 5),
        Addon(name: "Sauce à l'avocat", price: 4),
      ],
    ),
    Food(
      name: "Aloha Burger",
      description:
          "Un hamburger exotique avec un steak juteux, du fromage fondu, de l'ananas grillé et une sauce sucrée aux épices.",
      imagePath: "lib/images/burgers/d.jpg",
      price: 9,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Double portion de fromage", price: 8),
        Addon(name: "Bacon croustillant", price: 7),
        Addon(name: "Sauce teriyaki", price: 6),
      ],
    ),
    Food(
      name: "Blue Moon Burger",
      description:
          "Un hamburger gourmet avec un steak de bœuf prime, du fromage bleu fondant et des oignons caramélisés, servi sur un pain brioché.",
      imagePath: "lib/images/burgers/e.jpeg",
      price: 10,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Double portion de fromage bleu", price: 9),
        Addon(name: "Bacon fumé", price: 8),
        Addon(name: "Sauce au poivre noir", price: 7),
      ],
    ),
    Food(
      name: "Salade César",
      description:
          "Une salade fraîche et croquante avec du poulet grillé, des croûtons dorés et du parmesan râpé, le tout nappé d'une vinaigrette César crémeuse.",
      imagePath: "lib/images/salads/a.jpeg",
      price: 6,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocat frais", price: 5),
        Addon(name: "Oeuf dur tranché", price: 4),
        Addon(name: "Poitrine de poulet extra", price: 3),
      ],
    ),
    Food(
      name: "Salade Grècque",
      description:
          "Une salade méditerranéenne rafraîchissante avec des tomates juteuses, du concombre croquant, des olives kalamata et du feta émietté, assaisonnée d'une vinaigrette grecque authentique.",
      imagePath: "lib/images/salads/b.jpeg",
      price: 5,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Poivrons rouges grillés", price: 4),
        Addon(name: "Persil frais haché", price: 3),
        Addon(name: "Câpres", price: 2),
      ],
    ),
    Food(
      name: "Salade de Quinoa",
      description:
          "Une salade nutritive et colorée avec du quinoa tendre, des légumes croquants et des herbes fraîches, le tout assaisonné d'une vinaigrette légère au citron.",
      imagePath: "lib/images/burgers/c.webp",
      price: 6,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocat en dés", price: 5),
        Addon(name: "Graines de grenade", price: 4),
        Addon(name: "Noix de cajou grillées", price: 3),
      ],
    ),
    Food(
      name: "Salade Asiatique au Sésame",
      description:
          "Une salade asiatique croquante avec des nouilles de riz, des légumes frais et un dressing au sésame addictif, garnie de graines de sésame grillées.",
      imagePath: "lib/images/salads/d.jpeg",
      price: 7,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Edamame", price: 6),
        Addon(name: "Tofu grillé", price: 5),
        Addon(name: "Carottes marinées", price: 4),
      ],
    ),
    Food(
      name: "Salade de Poulet du Sud-Ouest",
      description:
          "Une salade copieuse avec du poulet grillé, du maïs rôti, des haricots noirs, des poivrons colorés et du cheddar râpé, le tout assaisonné d'une vinaigrette ranch épicée.",
      imagePath: "lib/images/salads/e.jpeg",
      price: 8,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Guacamole frais", price: 7),
        Addon(name: "Chips de tortilla croustillantes", price: 6),
        Addon(name: "Piments jalapeños tranchés", price: 5),
      ],
    ),
    Food(
      name: "Frites de patates douces croustillantes",
      description:
          "Des frites de patates douces dorées et croustillantes, saupoudrées de sel de mer et accompagnées d'une sauce à la coriandre et au citron vert.",
      imagePath: "lib/images/sides/a.jpeg",
      price: 4,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Mayonnaise épicée", price: 3),
        Addon(name: "Ketchup maison", price: 2),
        Addon(name: "Sauce au fromage", price: 1),
      ],
    ),
    Food(
      name: "Onion Rings",
      description:
          "Des rondelles d'oignon croustillantes et dorées, parfaitement assaisonnées et accompagnées d'une sauce barbecue maison.",
      imagePath: "lib/images/sides/b.jpg",
      price: 8,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Double portion de sauce barbecue", price: 7),
        Addon(name: "Mayonnaise à l'ail", price: 6),
        Addon(name: "Ketchup épicé", price: 5),
      ],
    ),
    Food(
      name: "Pain à l'Ail",
      description:
          "Du pain moelleux fraîchement sorti du four, garni de beurre à l'ail, de persil frais et de parmesan râpé.",
      imagePath: "lib/images/sides/bread.jpeg",
      price: 7,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Fromage fondu", price: 6),
        Addon(name: "Tomates séchées au soleil", price: 5),
        Addon(name: "Bacon grillé", price: 4),
      ],
    ),
    Food(
      name: "Frites de patates douces garnies",
      description:
          "Des frites de patates douces croustillantes garnies de guacamole frais, de salsa piquante et de crème sure.",
      imagePath: "lib/images/sides/c.jpg",
      price: 9,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheddar fondu", price: 8),
        Addon(name: "Chili épicé", price: 7),
        Addon(name: "Ciboulette fraîche", price: 6),
      ],
    ),
    Food(
      name: "Bouchées croustillantes de macaroni au fromage",
      description:
          "Des bouchées de macaroni au fromage croustillantes à l'extérieur et fondantes à l'intérieur, servies avec une sauce au fromage crémeuse.",
      imagePath: "lib/images/sides/sweetpot.jpeg",
      price: 10,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Bacon émietté", price: 9),
        Addon(name: "Piments jalapeños tranchés", price: 8),
        Addon(name: "Oignons verts hachés", price: 7),
      ],
    ),
    Food(
      name: "Brownie au chocolat",
      description:
          "Un délicieux brownie au chocolat, riche et fondant, garni de noix croquantes et servi avec une boule de crème glacée à la vanille.",
      imagePath: "lib/images/burgers/a.jpeg",
      price: 9,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Chocolat chaud", price: 8),
        Addon(name: "Caramel salé", price: 7),
        Addon(name: "Noix de pécan grillées", price: 6),
      ],
    ),
    Food(
      name: "Cheesecake",
      description:
          "Un cheesecake crémeux et onctueux sur une croûte de biscuits Graham, garni de fruits frais et d'un filet de coulis de fruits.",
      imagePath: "lib/images/desserts/c.jpg",
      price: 10,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Coulis de fraises", price: 9),
        Addon(name: "Zeste de citron", price: 8),
        Addon(name: "Myrtilles fraîches", price: 7),
      ],
    ),
    Food(
      name: "Tarte aux pommes",
      description:
          "Une tarte aux pommes maison avec une croûte feuilletée croustillante, des pommes fraîches et une touche de cannelle, servie avec de la crème fouettée.",
      imagePath: "lib/images/desserts/d.jpeg",
      price: 8,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Glace à la vanille", price: 7),
        Addon(name: "Caramel chaud", price: 6),
        Addon(name: "Noix de pécan caramélisées", price: 5),
      ],
    ),
    Food(
      name: "Red Velvet",
      description:
          "Un gâteau Red Velvet moelleux et velouté, garni d'un glaçage au fromage à la crème et de pépites de chocolat blanc.",
      imagePath: "lib/images/desserts/e.webp",
      price: 9,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Glaçage supplémentaire", price: 8),
        Addon(name: "Fraises tranchées", price: 7),
        Addon(name: "Granules de chocolat blanc", price: 6),
      ],
    ),
    Food(
      name: "Lemonade",
      description:
          "Une limonade rafraîchissante faite maison, parfumée avec des tranches de citron frais et garnie de feuilles de menthe.",
      imagePath: "lib/images/drinks/a.jpg",
      price: 6,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Tranches de citron supplémentaires", price: 5),
        Addon(name: "Glaçons supplémentaires", price: 4),
        Addon(name: "Sirop de fraise", price: 3),
      ],
    ),
    Food(
      name: "Iced Tea",
      description:
          "Un thé glacé sucré et rafraîchissant, infusé avec des sachets de thé noir et garni de quartiers de citron.",
      imagePath: "lib/images/drinks/b.jpg",
      price: 5,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Menthe fraîche", price: 4),
        Addon(name: "Tranches de citron", price: 3),
        Addon(name: "Sirop de pêche", price: 2),
      ],
    ),
    Food(
      name: "Smoothie",
      description:
          "Un smoothie fruité et sain, préparé avec des fraises juteuses, des bananes mûres et du yaourt nature, mixé à la perfection.",
      imagePath: "lib/images/drinks/c.jpg",
      price: 7,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Miel naturel", price: 6),
        Addon(name: "Flocons d'avoine", price: 5),
        Addon(name: "Graines de chia", price: 4),
      ],
    ),
    Food(
      name: "Mojito",
      description:
          "Un cocktail classique cubain avec du rhum blanc, du soda au citron-lime, du sucre de canne, des feuilles de menthe et des quartiers de citron vert.",
      imagePath: "lib/images/drinks/d.jpg",
      price: 8,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Feuilles de menthe fraîche", price: 7),
        Addon(name: "Tranches de citron vert", price: 6),
        Addon(name: "Sucre de canne supplémentaire", price: 5),
      ],
    ),
    Food(
      name: "Caramel Macchiato",
      description:
          "Un café macchiato avec du lait chaud, de l'espresso corsé et une touche de caramel sucré, garni d'une mousse de lait onctueuse.",
      imagePath: "lib/images/desserts/e.jpeg",
      price: 7,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Caramel supplémentaire", price: 6),
        Addon(name: "Poudre de cacao", price: 5),
        Addon(name: "Sirop de vanille", price: 4),
      ],
    ),
  ];
  List<Food> get menu => _menu;
}
