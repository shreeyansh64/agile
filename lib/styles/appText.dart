import 'package:flutter/material.dart';

double _responsive(BuildContext context, num size) {
  final width = MediaQuery.widthOf(context);
  return (width / 360) * size;
}

class AppText {
  static TextStyle heading(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 32),
    fontWeight: FontWeight.w900,
  );
  
  static TextStyle pageHeading(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 16),
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle textButton(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 12),
    fontWeight: FontWeight.w600,
  );
  
  static TextStyle button(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 16),
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle logo(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 32),
    fontWeight: FontWeight.w400,
  );
  
  static TextStyle styling(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 10),
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle onboardingHeading(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 20),
    fontWeight: FontWeight.w700,
  );
  
  static TextStyle heading1(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 32),
    fontWeight: FontWeight.w500,
  );
  
  static TextStyle content(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 14),
    fontWeight: FontWeight.w400,
  );
  
  static TextStyle boldButton(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 18),
    fontWeight: FontWeight.w400,
  );
  
  static TextStyle heading2(BuildContext context) => TextStyle(
    fontSize: _responsive(context, 24),
    fontWeight: FontWeight.w400,
  );
}