import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nurseryy/screens/login/login.dart';

import 'constant.dart';
import 'screens/home/home_screen.dart';

void main() async {
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var PageTransitionsType;
    return MaterialApp(
      title: 'Flutter animate login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: LoginScreen(),
    );
  }
}
