import 'package:flutter/material.dart';
import 'package:lkc/services/auth_service.dart';
import 'package:lkc/services/login_service.dart';
import 'package:lkc/services/routes_service.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';
import 'login/login.dart';

class Authenticator extends StatelessWidget {
  const Authenticator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Consumer<AuthService>(
        builder: (context, authService, child) {
          bool isLogin = authService.pref.getBool("login") ?? false;

          return isLogin
              ? Consumer<RoutesService>(
                  builder: (context, routesService, child) {
                    if (routesService.route == null) {
                      return Home();
                    } else {
                      return routesService.route;
                    }
                  },
                )
              : ChangeNotifierProvider<LoginService>(
                  create: (c) => LoginService(), child: Login());
        },
      ),
    );
  }
}
