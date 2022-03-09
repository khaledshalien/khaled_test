import 'package:flutter/material.dart';
import 'package:shared_pre/screens/login_screen.dart';
import 'package:shared_pre/services/services.dart';
import 'package:shared_pre/utils/Auth_button';
import 'package:shared_pre/utils/Auth_form';
import 'package:shared_pre/utils/Text_utils';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signupScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController controllername = TextEditingController();
  final TextEditingController controllerpassword = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllerphone = TextEditingController();
  Authentication auth = Authentication();
  //var name = Prefernces.getUserNameValue();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up screen"),
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
                      text: "SIGN UP",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontsize: 25,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthTextFromFild(
                      controller: controllername,
                      obscureText: false,
                      keyboardtype: TextInputType.text,
                      validator: (value) {},
                      prefixIcon: const Icon(Icons.person),
                      hintText: "User Name",
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
                      height: 25,
                    ),
                    AuthTextFromFild(
                      controller: controllerphone,
                      obscureText: false,
                      keyboardtype: TextInputType.phone,
                      validator: (value) {},
                      prefixIcon: const Icon(Icons.phone),
                      hintText: "Phone number",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthButton(
                        text: "Sign Up",
                        onpressed: () {
                          setState(() {
                            auth.signUpAuth(
                              controllername.text,
                              controlleremail.text,
                              controllerpassword.text,
                              controllerphone.text,
                            );
                          });
                          /*  Prefernces.saveUserNameValue(controllername.text);
                           print(Prefernces.getUserNameValue().toString());
                          print("Test*******************");*/
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: "Already have an Account?",
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontsize: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: MyText(
                            text: "Log in",
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
