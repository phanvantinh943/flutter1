import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Gà nướng",
      price: "100.000",
      imagePath: "assets/image/chicken.jpg",
      rating: "4.9",
    ),
    Food(
      name: "Lợn quay",
      price: "50.000",
      imagePath: "assets/image/pig.jpg",
      rating: "4.5",
    ),
    Food(
      name: "Tôm rim me",
      price: "20.000",
      imagePath: "assets/image/shrimp.jpg",
      rating: "4.7",
    ),
    Food(
      name: "Bò beefsteak",
      price: "200.000",
      imagePath: "assets/image/beef.jpg",
      rating: "5.0",
    ),
    Food(
      name: "Cua sốt me",
      price: "200.000",
      imagePath: "assets/image/crab.jpg",
      rating: "4.2",
    ),
    Food(
      name: "Ốc hương rang muối",
      price: "20.000",
      imagePath: "assets/image/oc.jpg",
      rating: "3.8",
    ),
  ];

  List<Food> _cart = [];
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
