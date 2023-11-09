import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/item_model_cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8)),
                            child: ListTile(
                              title: Text(value.cartItems[index][0]),
                              leading: Image.asset(
                                value.cartItems[index][2].toString(),
                                height: 36,
                              ),
                              subtitle: Text(
                                  "\$" + value.cartItems[index][1].toString()),
                              trailing: IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () => Provider.of<CartModel>(
                                          context,
                                          listen: false)
                                      .removeItemsFromCart(index)),
                            ),
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Totalprice",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 168, 219, 168)),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "\$" + value.calculateTotal(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),

                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("PayNow"),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
