import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                            Text("Log In", style: AppText.heading1(context)),
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
                        SizedBox(height: _responsive(33),),
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
                        SizedBox(height: _responsive(33),),
                        Column(
                          children: [
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
                                    color: Appcolors.blue1_normal
                                  )
                                )
                              ),
                            ),
                            SizedBox(height: _responsive(18)),
                            TextField(
                              decoration: InputDecoration(
                                label: Text("Password"),
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
                                    color: Appcolors.blue1_normal
                                  )
                                )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: _responsive(40),),
                        Column(
                          children: [
                            BlueButton(text: "Login"),
                            SizedBox(height: _responsive(10)),
                            TextButton(onPressed: (){Navigator.pushNamed(context, '/forgotPass');}, child: Text(
                              "Forgot password?",
                              style: AppText.textButton(
                                context,
                              ).copyWith(color: Appcolors.white_darker),
                            ),)
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
        floatingActionButton: floatBackButton()
      ),
    );
  }
}
