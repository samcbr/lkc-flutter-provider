import 'package:flutter/material.dart';
import 'package:lkc/app/home/home.dart';
import 'package:lkc/services/routes_service.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routesService = Provider.of<RoutesService>(context, listen: false);
    return WillPopScope(
      onWillPop: () {
        routesService.setRoute(Home());
        return Future<bool>.value(false);
      },
      child: Scaffold(
        body: Center(
          child: Text('My Account'),
        ),
      ),
    );
  }
}
