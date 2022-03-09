import 'package:flutter/material.dart';
import 'package:shared_pre/screens/information_screen.dart';
import 'package:shared_pre/shared_pre.dart';
import 'package:shared_pre/utils/Auth_button';

class WelcomeLoginScreen extends StatefulWidget {
  static const routeName = "/welcomeLoginScreen";

  @override
  State<WelcomeLoginScreen> createState() => _WelcomeLoginScreenState();
}

class _WelcomeLoginScreenState extends State<WelcomeLoginScreen> {
  var userName = "";
  @override
  void initState() {
    userName = Preferences.getStringName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1e33),
      appBar: AppBar(
        title: Text("welcome $userName"),
      ),
      body: Stack(
        children: [
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome $userName to Algebre",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AuthButton(
                      text: "Viwe Information",
                      onpressed: () {
                        Navigator.pushNamed(context, InfoScreen.routeName);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
