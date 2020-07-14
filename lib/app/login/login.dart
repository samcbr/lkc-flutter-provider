import 'package:flutter/material.dart';
import 'package:lkc/services/auth_service.dart';
import 'package:lkc/services/login_service.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final loginService = Provider.of<LoginService>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<LoginService>(
            builder: (context, loginService, child) {
              return TextField(
                onEditingComplete: () {},
                onChanged: (value) {
                  loginService.changeEmail(value);
                  loginService.validateEmail();
                },
                decoration: InputDecoration(
                  errorText: loginService.emailError ? 'Email error' : null,
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Login',
                  hintText: 'Enter your Email',
                ),
              );
            },
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              labelText: 'Password',
              hintText: 'Enter your Password',
            ),
          ),
          SizedBox(
            height: 64,
          ),
          RaisedButton(
            onPressed: () {
              authService.doLogin();
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
