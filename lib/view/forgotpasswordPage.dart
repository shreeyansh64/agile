import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: _responsive(639),
              left: _responsive(324),
              child: SvgPicture.asset(
                'assets/orangeLog.svg',
                height: _responsive(73),
                width: _responsive(73),
              ),
            ),
            Positioned(
              top: _responsive(109),
              right: _responsive(323),
              child: SvgPicture.asset(
                'assets/tealLog.svg',
                height: _responsive(73),
                width: _responsive(73),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(_responsive(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "Forgot Your Password?",
                          style: AppText.heading2(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: _responsive(9)),
                        Text(
                          "Don't worry it happens to the best of us. Enter",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "your email and we'll help you securely reset it.",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _responsive(86)),
                    TextField(
                      decoration: InputDecoration(
                        label: Text("Email"),
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Appcolors.white_normal_hover,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Appcolors.blue1_normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: _responsive(92)),
                    BlueButton(text: "Verify Email"),
                    Spacer()
                  ],
                ),
              ),
            ),
          ],
          
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: floatBackButton(),
      ),
    );
  }
}
