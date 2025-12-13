import 'package:agile/models/loginRequest.dart';
import 'package:agile/models/loginResponse.dart';
import 'package:agile/services/authServices.dart';
import 'package:agile/services/inputRegex.dart';
import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/inputField.dart';
import 'package:agile/widgets/passwordField.dart';
import 'package:agile/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  String emailErr = '';
  String passErr = '';
  bool emailErrb = true;
  bool passErrb = true;
  bool isClicked = false;
  final AuthService auth = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    Future<void> loginUser() async {
      try {
        final res = await auth.login(
          LoginRequest(
            username: emailController.text.trim(),
            password: passController.text.trim(),
          ),
        );
        showLoginSuccessToast(context);
        setState(() {
          isClicked = !isClicked;
        });
        Navigator.pushReplacementNamed(context, '/dashboard');
      } catch (e) {
        showLoginErrorToast(context);
        setState(() {
          isClicked = !isClicked;
        });
      }
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: _responsive(104),
              left: _responsive(319),
              child: SvgPicture.asset(
                'assets/orangeLog.svg',
                height: _responsive(73),
                width: _responsive(73),
              ),
            ),
            Positioned(
              top: _responsive(634),
              right: _responsive(318),
              child: SvgPicture.asset(
                'assets/tealLog.svg',
                height: _responsive(73),
                width: _responsive(73),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.heightOf(context),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(_responsive(20)),
                    child: Column(
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              "Log In",
                              style: AppText.heading1(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: _responsive(40)),
                            SizedBox(
                              height: _responsive(44),
                              width: _responsive(320),
                              child: SvgPicture.asset('assets/logGoo.svg'),
                            ),
                            SizedBox(height: _responsive(10)),
                            SizedBox(
                              height: _responsive(44),
                              width: _responsive(320),
                              child: SvgPicture.asset('assets/logGit.svg'),
                            ),
                          ],
                        ),
                        SizedBox(height: _responsive(33)),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.grey),
                            ),
                            SizedBox(width: _responsive(7)),
                            Text(
                              "or Log in with email",
                              style: AppText.content(context),
                            ),
                            SizedBox(width: _responsive(7)),
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: _responsive(33)),
                        Column(
                          children: [
                            inputField(
                              text: "Email",
                              controller: emailController,
                              errorText: emailErr,
                              err: emailErrb,
                            ),
                            SizedBox(height: _responsive(18)),
                            PasswordField(
                              text: "Password",
                              controller: passController,
                              errorText: passErr,
                              err: passErrb,
                            ),
                          ],
                        ),
                        SizedBox(height: _responsive(40)),
                        Column(
                          children: [
                            isClicked
                                ? SpinKitThreeBounce(
                                    color: Appcolors.blue1_light_active,
                                  )
                                : BlueButton(
                                    text: "Login",
                                    function: () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                      loginUser();
                                    },
                                  ),
                            SizedBox(height: _responsive(10)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forgotPass');
                              },
                              child: Text(
                                "Forgot password?",
                                style: AppText.textButton(
                                  context,
                                ).copyWith(color: Appcolors.white_darker),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
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
