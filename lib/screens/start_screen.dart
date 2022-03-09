import 'package:flutter/material.dart';
import 'package:shared_pre/screens/multi_screen.dart';

class StartScreen extends StatelessWidget {
  static const routeName = "/startScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "assets/images/back.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 150),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white70,
                  minimumSize: const Size(200, 40),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MultiScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
