import '../models/grocery.dart';

final dummyGroceryItems = [
  const Grocery(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: GroceryCategory.dairy),
  const Grocery(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: GroceryCategory.fruit),
  const Grocery(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: GroceryCategory.meat),
  const Grocery(
      id: 'd',
      name: 'Carrot',
      quantity: 10,
      category: GroceryCategory.vegetables),
];
