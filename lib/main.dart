import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_ok/screen/menu1.dart';
import 'package:my_ok/screen/menu2.dart';
import 'package:my_ok/screen/menu3.dart';
import 'package:my_ok/screen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      routes: <String, WidgetBuilder>{
        '/HOME': (BuildContext context) => new HomePage(),
        '/CART': (BuildContext context) => new Cart(),
        '/PROFILE': (BuildContext context) => new Profile(),
      },
    );
  }
}
