import 'package:flutter/material.dart';
import 'package:shared_pre/screens/information_screen.dart';
import 'package:shared_pre/screens/login_screen.dart';
import 'package:shared_pre/screens/multi_screen.dart';
import 'package:shared_pre/screens/signup_screen.dart';
import 'package:shared_pre/screens/start_screen.dart';
import 'package:shared_pre/screens/welcome_screen.dart';
import 'package:shared_pre/shared_pre.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
      initialRoute: StartScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => SignUpScreen(),
        InfoScreen.routeName: (context) => InfoScreen(),
        WelcomeLoginScreen.routeName: (context) => WelcomeLoginScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        StartScreen.routeName: (context) => StartScreen(),
        MultiScreen.routeName: (context) => MultiScreen(),
      },
    );
  }
}
