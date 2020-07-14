import 'package:flutter/widgets.dart';

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
