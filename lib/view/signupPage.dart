import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:agile/widgets/inputField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

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
                            Text("Sign Up", style: AppText.heading1(context).copyWith(fontWeight: FontWeight.bold)),
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
                        inputField(text: "Email", controller: emailController,),
                        SizedBox(height: _responsive(55)),
                        BlueButton(text: "Sign Up",function: (){Navigator.pushNamed(context, '/signupEmail');},),
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
        floatingActionButton: floatBackButton()
      ),
    );
  }
}
