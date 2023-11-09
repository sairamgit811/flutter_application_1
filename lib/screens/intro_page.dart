import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 80, left: 80, bottom: 10, top: 70),
            child: Image.asset("assets/images/avocado.png"),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "We deliver Groceries in your Doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          const Text("All items are fresh"),
          const Spacer(),
          GestureDetector(
            onTap: (() => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return (const HomePage());
                }))),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  "Get Started",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
