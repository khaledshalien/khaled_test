import 'package:flutter/material.dart';
import 'package:shared_pre/screens/signup_screen.dart';
import 'package:shared_pre/screens/welcome_screen.dart';
import 'package:shared_pre/services/services.dart';
import 'package:shared_pre/utils/Auth_button';
import 'package:shared_pre/utils/Auth_form';
import 'package:shared_pre/utils/Text_utils';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Authentication auth = Authentication();
  final formkey = GlobalKey<FormState>();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Log In screen"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    MyText(
                      text: "LOG IN",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontsize: 25,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthTextFromFild(
                      controller: controlleremail,
                      obscureText: false,
                      keyboardtype: TextInputType.emailAddress,
                      validator: (value) {},
                      prefixIcon: const Icon(Icons.email),
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthTextFromFild(
                      controller: controllerpassword,
                      obscureText: true,
                      keyboardtype: TextInputType.visiblePassword,
                      validator: (value) {},
                      prefixIcon: const Icon(Icons.lock),
                      hintText: "password",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthButton(
                        text: "LOG IN",
                        onpressed: () {
                          auth.logInAuth(
                            context,
                            controlleremail.text,
                            controllerpassword.text,
                          );
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: "Don't have an Account?",
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontsize: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: MyText(
                            text: "SIGN UP",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontsize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
