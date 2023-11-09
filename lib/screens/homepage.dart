import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/grocery_item_list.dart';
import 'package:flutter_application_1/models/item_model_cart.dart';
import 'package:flutter_application_1/screens/cartpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartPage();
        })),
        backgroundColor: Colors.black,
        child: Badge(
          badgeContent: Text(
            Provider.of<CartModel>(context).counter.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.shopping_bag),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good morning"),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                    itemBuilder: (context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0].toString(),
                        itemPrice: value.shopItems[index][1].toString(),
                        itempath: value.shopItems[index][2].toString(),
                        color: value.shopItems[index][3],
                        onPressed: () {
                          setState(() {
                            if (Provider.of<CartModel>(context, listen: false)
                                    .counter !=
                                0) {
                              Provider.of<CartModel>(context, listen: false)
                                  .counter;
                            } else {
                              Provider.of<CartModel>(context, listen: false)
                                  .counter;
                            }
                          });
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
