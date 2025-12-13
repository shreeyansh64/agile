import 'package:agile/services/authServices.dart';
import 'package:agile/services/inputRegex.dart';
import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  String emailErr = '';
  bool emailErrb = true;
  bool isClicked = false;
  final AuthService auth = AuthService();

  Future<void> emailStatus()async{
    try {
      final res = await auth.emailStatus(emailController.text.trim());
      print('*** OUTPUT : \n ${res.isEmail} and ${res.isVerified}');
      if (res.isEmail && res.isVerified) {
        Navigator.pushNamed(context, '/login');
      }else if(res.isEmail && !res.isVerified){
        Navigator.pushNamed(context, '/signupOtpPage');
      }else{
        Navigator.pushNamed(context, '/signupEmail');
      }
      setState(() {
        isClicked = !isClicked;
      });
    } catch (e) {
      print("Error ----> \n $e");
      setState(() {
        isClicked = !isClicked;
      });
      throw Exception("Problem Checking emailStatus : \n $e");
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
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
                              "Sign Up",
                              style: AppText.heading1(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: _responsive(40)),
                            SizedBox(
                              height: _responsive(44),
                              width: _responsive(320),
                              child: SvgPicture.asset('assets/sigGoo.svg'),
                            ),
                            SizedBox(height: _responsive(10)),
                            SizedBox(
                              height: _responsive(44),
                              width: _responsive(320),
                              child: SvgPicture.asset('assets/sigGit.svg'),
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
                              "or Sign Up with email",
                              style: AppText.content(context),
                            ),
                            SizedBox(width: _responsive(7)),
                            Expanded(
                              child: Divider(thickness: 1, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: _responsive(33)),
                        inputField(
                          text: "Email",
                          controller: emailController,
                          errorText: emailErr,
                          err: emailErrb,
                        ),
                        SizedBox(height: _responsive(55)),
                        isClicked
                            ? SpinKitThreeBounce(
                                color: Appcolors.blue1_light_active,
                              )
                            : BlueButton(
                                text: "Sign Up",
                                function: () {
                                  setState(() {
                                    isClicked = !isClicked;
                                  });
                                  final emailValid = InputRegex.isEmailValid(
                                    emailController.text.trim(),
                                  );
                                  setState(() {
                                    emailErrb = emailValid;
                                    emailErr = emailValid
                                        ? ''
                                        : 'Invalid email format or too long (max 15 chars)';
                                  });
                                  if (emailValid) {
                                    emailStatus();
                                  }else{
                                    setState(() {
                                      isClicked = !isClicked;
                                    });
                                  }
                                },
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
