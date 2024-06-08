import 'package:firebase_core/firebase_core.dart';
import 'package:level_1/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}