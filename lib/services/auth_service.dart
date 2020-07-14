import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  bool isLogin = false;

  static SharedPreferences sharedPreferences;

  doLogin() async {
    final response = await http.post(
      'https://reqres.in/api/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      isLogin = true;
      await sharedPreferences.setBool("login", true);
      notifyListeners();
    }
  }

  doLogout() async {
    await sharedPreferences.setBool("login", false);
    notifyListeners();
  }

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get pref => sharedPreferences;
}
