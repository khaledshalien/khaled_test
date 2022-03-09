import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_pre/screens/welcome_screen.dart';
import 'package:shared_pre/shared_pre.dart';
import 'package:flutter/material.dart';

import '../model/user_model';

class Authentication {
  // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//************** (Start) Send data to the internet(post request method-signup) *****************************/
  Future signUpAuth(
      String name, String email, String password, String phone) async {
    var data = {
      "full_name": name,
      "facility_type": "Company",
      "company_name": "Algebra",
      "email": email,
      "phone": phone,
      "password": password,
      "city": 1
    };
    final response = await http.post(
        Uri.parse('http://46.101.213.145:8080/api/v1/auth/registration/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      print(response.body);
    }
  }

//************** (End) Send data to the internet(post request method) *****************************/
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//************** (Start) Send data to the internet(post request method-login) *****************************/
  Future logInAuth(
    BuildContext context,
    String email,
    String password,
  ) async {
    var data = {
      "email": email,
      "password": password,
    };
    final response = await http.post(
        Uri.parse('http://46.101.213.145:8080/api/v1/auth/authenticating/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      var getBody = json.decode(response.body);
      Preferences.setIntUserId(getBody["user_id"]);
      Preferences.setStringName(getBody["full_name"]);
      Preferences.setStringToken(getBody["token"]);
      Navigator.pushNamed(context, WelcomeLoginScreen.routeName);
      return getBody;
    } else {
      return showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Row(
                children: const [
                  Icon(Icons.error, color: Colors.red),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Error !",
                      style: TextStyle(
                        color: Colors.red,
                      )),
                ],
              ),
              content: Text(response.body),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back"))
              ],
            );
          });
    }
  }

//**************(End) send data to the internet(post request method-signin) *****************************/

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

//**************(Start) fetch data from the internet *****************************/
  Future<UserModel> userInfo() async {
    var uerId = Preferences.getIntUserId();
    var tokenId = Preferences.getStringToken();
    final response = await http.get(
        Uri.parse('http://46.101.213.145:8080/api/v1/auth/user/$uerId/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer $tokenId",
        });
    print(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

//**************(End) Update data over the internet (patch methods) *****************************/

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

//************** (Start) UpDate data from the internet (patch methods)*****************************/
  Future updateData(String userName) {
    var uerId = Preferences.getIntUserId();
    var tokenId = Preferences.getStringToken();
    var date = {
      'full_name': userName,
    };
    return http.put(
      Uri.parse('http://46.101.213.145:8080/api/v1/auth/user/$uerId/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        HttpHeaders.authorizationHeader: "Bearer $tokenId",
      },
      body: jsonEncode(date),
    );

//************** (End) Update data over the internet (patch methods) ******************************/
  }
}
