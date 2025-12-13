import 'package:agile/models/forgotPasswordModels.dart';
import 'package:agile/services/authServices.dart';
import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:agile/widgets/toasts.dart';
import 'package:hive/hive.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final AuthService auth = AuthService();
  bool isClicked = false;
  String emailErr = '';
  bool err = true;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _responsive(num value) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * value;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                          style: AppText.heading2(context)
                              .copyWith(fontWeight: FontWeight.bold),
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
                    inputField(
                      text: "Email",
                      controller: emailController,
                      errorText: emailErr,
                      err: err,
                    ),
                    SizedBox(height: _responsive(92)),
                    isClicked
                        ? CircularProgressIndicator(color: Appcolors.blue1_light_active)
                        : BlueButton(
                            text: "Verify Email",
                            function: () async {
                              setState(() => isClicked = true);
                              final emailValid = emailController.text.contains('@');
                              setState(() {
                                err = emailValid;
                                emailErr = emailValid ? '' : 'Invalid email';
                              });
                              if (emailValid) {
                                try {
                                  final res = await auth.forgotPassword(
                                    ForgotPasswordRequest(
                                      email: emailController.text.trim(),
                                    ),
                                  );
                                  var box = await Hive.openBox('auth');
                                  await box.put('signup_email', res.email);
                                  Navigator.pushNamed(context, '/signupOtpPage');
                                } catch (e) {
                                  resendOtpErr(context);
                                }
                              }
                              setState(() => isClicked = false);
                            },
                          ),
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
