import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/inputField.dart';
import 'package:agile/widgets/passwordField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  final String emailErr = '';
  final String usernameErr = '';
  final String passErr= '';
  final String confPassErr = '';
  final bool emailErrb = true;
  final bool usernameErrb= true;
  final bool passErrb = true;
  final bool confPassErrb = true;

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
      onTap: (){FocusScope.of(context).unfocus();},
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
                    inputField(text: "Email", controller: emailController, errorText: emailErr, err: emailErrb,),
                    SizedBox(height: _responsive(10)),
                    inputField(text: "Username", controller: usernameController, errorText: usernameErr, err: usernameErrb,),
                    SizedBox(height: _responsive(10)),
                    PasswordField(text: "Password", controller: passController, errorText: passErr, err: passErrb,),
                    SizedBox(height: _responsive(10)),
                    PasswordField(text: "Confirm Password", controller: confPassController, errorText: confPassErr, err: confPassErrb,),
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
                    BlueButton(text: "Sign Up", function: () {}),
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
