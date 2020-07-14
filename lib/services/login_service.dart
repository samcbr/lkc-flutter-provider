import 'package:flutter/widgets.dart';
//This is a provider used for validating login form

class LoginService with ChangeNotifier {
  String email;
  bool emailError = false;
  void changeEmail(String email) {
    this.email = email;
  }

  void validateEmail() {
    if (email.length < 5) {
      emailError = true;
      print('validating');
      notifyListeners();
      return;
    }
    emailError = false;
    notifyListeners();
  }
}
