import 'package:agile/view/forgotpasswordPage.dart';
import 'package:agile/view/loginPage.dart';
import 'package:agile/view/onBoard.dart';
import 'package:agile/view/otpPage.dart';
import 'package:agile/view/resetpasswordPage.dart';
import 'package:agile/view/signupEmailPage.dart';
import 'package:agile/view/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main()async{
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.figtreeTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> OnBoard(),
        '/login':(context)=> LoginPage(),
        '/signup':(context)=> SignupPage(),
        '/signupEmail':(context)=> SignupEmailPage(),
        '/forgotPass':(context)=> ForgotPasswordPage(),
        '/resetPass':(context)=> ResetpasswordPage(),
        '/otpPage':(context)=> otpPage(),
      },
    );
  }
}