import 'package:flutter/material.dart';
import 'package:my_ok/screen/login.dart';
import 'package:my_ok/screen/menu1.dart';
import 'package:my_ok/screen/menu2.dart';
import 'package:my_ok/screen/menu3.dart';
import 'package:my_ok/screen/register.dart';
import 'package:my_ok/screen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: <String, WidgetBuilder> {
        // '/LOGIN': (BuildContext context) => new LoginScreen(),
        // '/REGISTER': (BuildContext context) => new RegisterScreen(),
        '/HOME': (BuildContext context) => new HomePage(),
        '/CART': (BuildContext context) => new Cart(),
        '/PROFILE': (BuildContext context) => new Profile(),
      },
    );
  }
}
