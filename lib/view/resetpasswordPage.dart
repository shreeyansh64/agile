import 'package:agile/services/authServices.dart';
import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/passwordField.dart';
import 'package:agile/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

class ResetpasswordPage extends StatefulWidget {
  const ResetpasswordPage({super.key});

  @override
  State<ResetpasswordPage> createState() => _ResetpasswordPageState();
}

class _ResetpasswordPageState extends State<ResetpasswordPage> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  final AuthService auth = AuthService();
  String passErr = '';
  String confPassErr = '';
  bool passErrb = true;
  bool confPassErrb = true;
  bool isClicked = false;

  @override
  void dispose() {
    passController.dispose();
    confPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
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
            Padding(
              padding: EdgeInsets.all(_responsive(20)),
              child: Center(
                child: Column(
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "Reset Password",
                          style: AppText.heading2(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: _responsive(9)),
                        Text(
                          "Create a new password to secure your account.",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Make sure it's strong and easy for you to",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "remember.",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _responsive(45)),
                    PasswordField(
                      text: "Password",
                      controller: passController,
                      errorText: passErr,
                      err: passErrb,
                    ),
                    SizedBox(height: _responsive(10)),
                    PasswordField(
                      text: "Confirm Password",
                      controller: confPassController,
                      errorText: confPassErr,
                      err: confPassErrb,
                    ),
                    SizedBox(height: _responsive(45)),
                    isClicked
                        ? CircularProgressIndicator(
                            color: Appcolors.blue1_light_active,
                          )
                        : BlueButton(
                            text: "Reset Password",
                            function: () async {
                              setState(() => isClicked = true);
                              if (passController.text !=
                                  confPassController.text) {
                                setState(() {
                                  confPassErrb = false;
                                  confPassErr = 'Passwords do not match';
                                  isClicked = false;
                                });
                                return;
                              }
                              try {
                                final box = await Hive.openBox('auth');
                                final resetToken = box.get('reset_token');
                                final success = await auth.completeReset(
                                  resetToken,
                                  passController.text.trim(),
                                  confPassController.text.trim(),
                                );
                                if (success) {
                                  showPasswordResetSuccessToast(context);
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/login',
                                    (route) => false,
                                  );
                                } else {
                                  resendOtpErr(context);
                                }
                              } catch (e) {
                                resendOtpErr(context);
                              }
                              setState(() => isClicked = false);
                            },
                          ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: floatBackButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      ),
    );
  }
}
