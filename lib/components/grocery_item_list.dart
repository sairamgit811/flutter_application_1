import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itempath;
  final Color color;
  void Function()? onPressed;

  // ignore: non_constant_identifier_names
  GroceryItemTile(
      {required this.itemName,
      required this.itemPrice,
      required this.itempath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color.withOpacity(0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              itempath,
              height: 64,
            ),
            Text(itemName),
            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                "\$" + itemPrice,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
