import 'dart:async';
import 'package:agile/models/sendOtpRequest.dart';
import 'package:agile/services/authServices.dart';
import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:pinput/pinput.dart';
import 'package:agile/widgets/toasts.dart';

class SignupOtpPage extends StatefulWidget {
  const SignupOtpPage({super.key});

  @override
  State<SignupOtpPage> createState() => _SignupOtpPageState();
}

class _SignupOtpPageState extends State<SignupOtpPage> {
  final TextEditingController otpController = TextEditingController();
  final AuthService auth = AuthService();
  bool isClicked = false;
  bool canResend = true;
  int resendSeconds = 30;
  Timer? _resendTimer;

  @override
  void dispose() {
    otpController.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void startResendTimer() {
    setState(() {
      canResend = false;
      resendSeconds = 30;
    });

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds == 0) {
        timer.cancel();
        setState(() => canResend = true);
      } else {
        setState(() => resendSeconds--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double _responsive(num value) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * value;
    }

    final otpTheme = PinTheme(
      width: _responsive(50),
      height: _responsive(50),
      decoration: BoxDecoration(
        color: Appcolors.white_normal_hover,
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: AppText.heading(context),
    );

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
                          "Verification",
                          style: AppText.heading2(
                            context,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: _responsive(9)),
                        Text(
                          "Verify your identity to continue. Enter the OTP",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "we've sent to your registered email.",
                          style: AppText.content(context).copyWith(
                            color: Appcolors.white_darker,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _responsive(75)),
                    Pinput(
                      length: 6,
                      defaultPinTheme: otpTheme,
                      focusedPinTheme: otpTheme.copyWith(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Appcolors.blue1_normal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolors.white_normal_hover,
                        ),
                      ),
                      onChanged: (value) => otpController.text = value,
                    ),
                    SizedBox(height: _responsive(75)),
                    Column(
                      children: [
                        isClicked
                            ? CircularProgressIndicator(
                                color: Appcolors.blue1_light_active,
                              )
                            : BlueButton(
                                text: "Verify OTP",
                                function: () async {
                                  setState(() => isClicked = true);
                                  try {
                                    final box = await Hive.openBox('auth');
                                    final email = box.get('signup_email');

                                    print('Email from Hive: $email');
                                    print(
                                      'OTP entered: ${otpController.text.trim()}',
                                    );

                                    final res = await auth.verifyOtp(
                                      email,
                                      otpController.text.trim(),
                                    );

                                    print('Verify OTP response: $res');

                                    if (res) {
                                      showSignupSuccessToast(context);
                                      Navigator.pushReplacementNamed(
                                        context,
                                        '/dashboard',
                                      );
                                    } else {
                                      showWrongOtp(context);
                                    }
                                  } catch (e) {
                                    print('OTP Verification Error: $e');
                                    showWrongOtp(context);
                                  }
                                  setState(() => isClicked = false);
                                },
                              ),
                        SizedBox(height: _responsive(20)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: canResend
                                ? () async {
                                    setState(() => isClicked = true);
                                    var box = await Hive.openBox('auth');
                                    final email = box.get('signup_email');
                                    final success = await auth.resendOtp(
                                      SendOtpRequest(
                                        email: email,
                                        purpose: 'registration',
                                      ),
                                    );
                                    if (success) {
                                      showResendOtpSuccessToast(context);
                                      startResendTimer();
                                    } else {
                                      resendOtpErr(context);
                                    }
                                    setState(() => isClicked = false);
                                  }
                                : null,
                            child: Text(
                              canResend
                                  ? "Resend OTP"
                                  : "Resend OTP in $resendSeconds s",
                              style: AppText.textButton(context).copyWith(
                                color: canResend
                                    ? Appcolors.white_darker
                                    : Appcolors.white_darker.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
