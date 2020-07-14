import 'package:flutter/material.dart';
import 'package:lkc/app/auth_widget.dart';
import 'package:lkc/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthService>(
      create: (c) => AuthService(),
      child: MaterialApp(
        home: Authenticator(),
      ),
    );
  }
}
