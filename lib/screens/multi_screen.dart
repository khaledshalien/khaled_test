import 'package:flutter/material.dart';
import 'package:shared_pre/screens/information_screen.dart';
import 'package:shared_pre/screens/login_screen.dart';
import 'package:shared_pre/screens/signup_screen.dart';
import 'package:shared_pre/utils/Auth_button';

class MultiScreen extends StatelessWidget {
  static const routeName = "/multiScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(title: const Text("Welcome Wcreen")),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/back.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 70,
                ),
                AuthButton(
                    text: "Sign Up",
                    onpressed: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    }),
                const SizedBox(
                  height: 50,
                ),
                AuthButton(
                    text: "Log in",
                    onpressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    }),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
