import 'package:agile/view/loginPage.dart';
import 'package:agile/view/onBoard.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> OnBoard(),
        '/login':(context)=> LoginPage()
      },
    );
  }
}