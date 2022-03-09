// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences preferences;

  static const String SHARED_PREFERENCES_SELECTED_USERNAME = "name";
  static const String SHARED_PREFERENCES_SELECTED_EMAIL = "email";
  static const String SHARED_PREFERENCES_SELECTED_PASSWORD = "password";
  static const String SHARED_PREFERENCES_SELECTED_PHONE = "phone";
  static const String SHARED_PREFERENCES_SELECTED_USER_ID = "user_id";
  static const String SHARED_PREFERENCES_SELECTED_TOKEN = "token";

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

// ************* (Start) Methods Set Data **********************************************///
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

// ************* (Start) Methods Set & get Data ID ********************************///
  static setIntUserId(int userid) {
    preferences.setInt(SHARED_PREFERENCES_SELECTED_USER_ID, userid);
  }

  static int getIntUserId() {
    return preferences.getInt(SHARED_PREFERENCES_SELECTED_USER_ID);
  }
// ************* (End) Methods Set & get Data ID ********************************///

// ************* (Start) Methods Set & get Data NAME ********************************///
  static setStringName(String name) {
    preferences.setString(SHARED_PREFERENCES_SELECTED_USERNAME, name);
  }

  static String getStringName() {
    return preferences.getString(SHARED_PREFERENCES_SELECTED_USERNAME);
  }
// ************* (End) Methods Set & get Data NAME ********************************///

// ************* (Start) Methods Set & get Data EMAIL ********************************///
  static setStringEmail(String email) {
    preferences.setString(SHARED_PREFERENCES_SELECTED_EMAIL, email);
  }

  static String getStringEmail() {
    return preferences.getString(SHARED_PREFERENCES_SELECTED_EMAIL);
  }
// ************* (End) Methods Set & get Data EMAIL ********************************///

// ************* (Start) Methods Set & get Data PASSWORD ********************************///
  static setStringPassword(String password) {
    preferences.setString(SHARED_PREFERENCES_SELECTED_PASSWORD, password);
  }

  static String getStringPassword() {
    return preferences.getString(SHARED_PREFERENCES_SELECTED_PASSWORD);
  }
// ************* (End) Methods Set & get Data PASSWORD ********************************///

// ************* (Start) Methods Set & get Data PHONE ********************************///
  static setStringPhone(String phone) {
    preferences.setString(SHARED_PREFERENCES_SELECTED_PHONE, phone);
  }

  static String getStringPhone() {
    return preferences.getString(SHARED_PREFERENCES_SELECTED_PHONE);
  }
// ************* (End) Methods Set & get Data PASSWORD ********************************///

// ************* (Start) Methods Set & get Data TOKEN ********************************///
  static setStringToken(String token_User) {
    preferences.setString(SHARED_PREFERENCES_SELECTED_TOKEN, token_User);
  }

  static String getStringToken() {
    return preferences.getString(SHARED_PREFERENCES_SELECTED_TOKEN);
  }
// ************* (End) Methods Set & get Data TOKEN ********************************///

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// ************* (End) Methods Set Data **********************************************///

}
