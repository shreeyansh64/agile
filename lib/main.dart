import 'dart:io';
import 'package:agile/view/dashboard.dart';
import 'package:agile/view/forgotpasswordPage.dart';
import 'package:agile/view/loginPage.dart';
import 'package:agile/view/onBoard.dart';
import 'package:agile/view/resetPasswordOtp.dart';
import 'package:agile/view/signupOtpPage.dart';
import 'package:agile/view/resetpasswordPage.dart';
import 'package:agile/view/signupEmailPage.dart';
import 'package:agile/view/signupPage.dart';
import 'package:agile/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await Hive.openBox('auth');
  runApp(
    ToastificationWrapper(
      child: const MyApp(),
    ),
  );
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
        '/': (context) => OnBoard(),
        '/splash': (context) => SplashScreen(),
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/signupEmail': (context) => SignupEmailPage(),
        '/forgotPass': (context) => ForgotPasswordPage(),
        '/resetPass': (context) => ResetpasswordPage(),
        '/resetPasswordOtpPage': (context) => ResetPasswordOtpPage(),
        '/signupOtpPage': (context) => SignupOtpPage(),
      },
    );
  }
}
