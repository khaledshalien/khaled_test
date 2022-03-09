import 'package:flutter/material.dart';
import 'package:shared_pre/model/user_model';
import 'package:shared_pre/shared_pre.dart';
import 'package:shared_pre/utils/Auth_form';
import 'package:shared_pre/utils/Text_utils';

import '../services/services.dart';

class InfoScreen extends StatefulWidget {
  static const routeName = "/informationScreen";
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  var userName = "";
  Authentication auth = Authentication();
  TextEditingController controllere_mail_info = TextEditingController();
  TextEditingController controllere_password_info = TextEditingController();
  TextEditingController controller_name_info = TextEditingController();
  TextEditingController controller_phone_info = TextEditingController();
  @override
  void initState() {
    userName = Preferences.getStringName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Information User"),
        centerTitle: true,
      ),
      body: FutureBuilder<UserModel>(
        future: auth.userInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controllere_mail_info.text = snapshot.data.email;
            controllere_password_info.text = snapshot.data.password;
            controller_name_info.text = snapshot.data.name;
            controller_phone_info.text = snapshot.data.phone;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  MyText(
                    text: "Update Account Information",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontsize: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[800],
                    ),
                    child: Column(
                      children: [
                        MyText(
                          text: "$userName",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontsize: 15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthTextFromFild(
                          controller: controllere_mail_info,
                          obscureText: false,
                          keyboardtype: TextInputType.emailAddress,
                          validator: (val) {},
                          prefixIcon: const Icon(Icons.email),
                          hintText: "test",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthTextFromFild(
                          controller: controllere_password_info,
                          obscureText: false,
                          keyboardtype: TextInputType.emailAddress,
                          validator: (val) {},
                          prefixIcon: Icon(Icons.lock),
                          hintText: "test",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthTextFromFild(
                          controller: controller_name_info,
                          obscureText: false,
                          keyboardtype: TextInputType.name,
                          validator: (val) {},
                          prefixIcon: const Icon(Icons.person),
                          hintText: "test",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthTextFromFild(
                          controller: controller_phone_info,
                          obscureText: false,
                          keyboardtype: TextInputType.phone,
                          validator: (val) {},
                          prefixIcon: Icon(Icons.phone),
                          hintText: "test",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[600],
                            minimumSize: Size(150, 40),
                          ),
                          child: MyText(
                            text: "Save Info",
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontsize: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              /*  authGet.updateData(
                                  controller_name_info.text,
                                  controllere_mail_info.text,
                                  controllere_password_info.text,
                                  controller_phone_info.text,
                                );*/
                            });
                          },
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 40),
                                primary: Colors.green),
                            onPressed: () {
                              setState(() {});
                            },
                            child: MyText(
                              text: "Update",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontsize: 20,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('There is an error'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}
