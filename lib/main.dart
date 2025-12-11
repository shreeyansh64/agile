import 'package:agile/view/forgotpasswordPage.dart';
import 'package:agile/view/loginPage.dart';
import 'package:agile/view/onBoard.dart';
import 'package:agile/view/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.figtreeTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> OnBoard(),
        '/login':(context)=> LoginPage(),
        '/signup':(context)=> SignupPage(),
        '/forgotPass':(context)=> ForgotPasswordPage()
      },
    );
  }
}