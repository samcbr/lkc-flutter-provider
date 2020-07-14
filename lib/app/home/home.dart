import 'package:flutter/material.dart';
import 'package:lkc/app/account/account.dart';
import 'package:lkc/services/auth_service.dart';
import 'package:lkc/services/routes_service.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final routesService = Provider.of<RoutesService>(context, listen: false);
    return Scaffold(
      /*body: RaisedButton(
        onPressed: () {
          authService.doLogout();
        },
      ),*/
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Icon(Icons.refresh),
                      flex: 1,
                    ),
                    Expanded(
                      child: Icon(Icons.shopping_cart),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Colors.white,
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image.network(
                          'https://via.placeholder.com/600/92c952',
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ), //Add image url here from provider
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Our Services',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          routesService.setRoute(Account());
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
