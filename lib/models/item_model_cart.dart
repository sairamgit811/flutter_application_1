import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  int counter = 0;
  final List _shopItems = [
    ["Avocado", "4.0", "assets/images/avocado.png", Colors.green],
    ["banana", "2.50", "assets/images/banana.png", Colors.yellow],
    ["chicken", "12.80", "assets/images/chicken.png", Colors.brown],
    ["water", "1.0", "assets/images/water.png", Colors.blue]
  ];

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    counter++;
    notifyListeners();
  }

  void removeItemsFromCart(int index) {
    _cartItems.removeAt(index);
    counter--;
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
