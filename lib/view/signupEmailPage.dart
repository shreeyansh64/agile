import 'package:agile/models/signupRequestModel.dart';
import 'package:agile/services/authServices.dart';
import 'package:agile/services/inputRegex.dart';
import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/deadButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/inputField.dart';
import 'package:agile/widgets/passwordField.dart';
import 'package:agile/widgets/toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

class SignupEmailPage extends StatefulWidget {
  const SignupEmailPage({super.key});

  @override
  State<SignupEmailPage> createState() => _SignupEmailPageState();
}

class _SignupEmailPageState extends State<SignupEmailPage> {
  bool isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confPassController = TextEditingController();
  String emailErr = '';
  String usernameErr = '';
  String passErr = '';
  String confPassErr = '';
  bool emailErrb = true;
  bool usernameErrb = true;
  bool passErrb = true;
  bool confPassErrb = true;
  bool isClicked = false;

  final AuthService auth = AuthService();

  Future<void> signup() async {
    try {
      final res = await auth.signup(
        SignupRequest(
          email: emailController.text.trim(),
          password: passController.text.trim(),
          password2: confPassController.text.trim(),
          username: usernameController.text.trim(),
        ),
      );
      setState(() {
        isClicked = !isClicked;
      });
      Navigator.pushReplacementNamed(context, '/signupOtpPage');
    } catch (e) {
      print('Error----------------> $e');
      showSignupErrorToast(context);
      setState(() {
        isClicked = !isClicked;
      });
      throw Exception("Coudn't signup : $e");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    usernameController.dispose();
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
        body: SizedBox(
          height: MediaQuery.maybeHeightOf(context),
          child: Stack(
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
                padding: EdgeInsetsGeometry.all(_responsive(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "Sign Up",
                      style: AppText.heading1(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: _responsive(40)),
                    inputField(
                      text: "Email",
                      controller: emailController,
                      errorText: emailErr,
                      err: emailErrb,
                    ),
                    SizedBox(height: _responsive(10)),
                    inputField(
                      text: "Username",
                      controller: usernameController,
                      errorText: usernameErr,
                      err: usernameErrb,
                    ),
                    SizedBox(height: _responsive(10)),
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
                    SizedBox(height: _responsive(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CheckboxTheme(
                          data: CheckboxThemeData(
                            splashRadius: 20,
                            fillColor: isChecked
                                ? MaterialStateProperty.all(
                                    Appcolors.blue1_normal,
                                  )
                                : MaterialStateProperty.all(Colors.white),
                            checkColor: MaterialStateProperty.all(Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(4),
                            ),
                          ),
                          child: Transform.scale(
                            scale: _responsive(0.8),
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (v) {
                                setState(() {
                                  isChecked = v!;
                                });
                              },
                            ),
                          ),
                        ),
                        Text(
                          "I Agree with the ",
                          style: AppText.textButton(context),
                        ),
                        Text(
                          "Terms and Policy",
                          style: AppText.textButton(context).copyWith(
                            color: Appcolors.blue1_normal,
                            decoration: TextDecoration.underline,
                            decorationColor: Appcolors.blue1_normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: _responsive(40)),
                    isChecked
                        ? isClicked
                              ? SpinKitThreeBounce(
                                  color: Appcolors.blue1_light_active,
                                )
                              : BlueButton(
                                  text: "Sign Up",
                                  function: () async {
                                    setState(() {
                                      isClicked = !isClicked;
                                    });
                                    final emailValid = InputRegex.isEmailValid(
                                      emailController.text.trim(),
                                    );
                                    final usernameValid =
                                        InputRegex.isUsernameValid(
                                          usernameController.text.trim(),
                                        );
                                    final passwordValid =
                                        InputRegex.isPasswordValid(
                                          passController.text.trim(),
                                        );
                                    final confPassValid =
                                        passController.text.trim() ==
                                            confPassController.text.trim() &&
                                        InputRegex.isPasswordValid(
                                          confPassController.text.trim(),
                                        );

                                    setState(() {
                                      emailErrb = emailValid;
                                      usernameErrb = usernameValid;
                                      passErrb = passwordValid;
                                      confPassErrb = confPassValid;

                                      emailErr = emailValid
                                          ? ''
                                          : 'Invalid email or too long (max 15 chars)';
                                      usernameErr = usernameValid
                                          ? ''
                                          : '1-15 letters, numbers, or underscore';
                                      passErr = passwordValid
                                          ? ''
                                          : 'Min 8 chars, 1 uppercase, 1 number, 1 special, max 15';
                                      confPassErr = confPassValid
                                          ? ''
                                          : 'Passwords do not match or invalid';
                                    });

                                    if (emailValid &&
                                        usernameValid &&
                                        passwordValid &&
                                        confPassValid) {
                                      var box = await Hive.openBox('auth');
                                      await box.put(
                                        'signup_email',
                                        emailController.text.trim(),
                                      );
                                      signup();
                                    } else {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    }
                                  },
                                )
                        : DeadButton(
                            text: "Sign Up",
                            function: () {
                              termsAndCondition(context);
                            },
                          ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: floatBackButton(),
      ),
    );
  }
}
