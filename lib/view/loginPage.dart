import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
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
        body: SingleChildScrollView(
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
                    Spacer(),
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
                    Spacer(),
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            label: Text("Email"),
                            fillColor: Appcolors.white_normal_hover,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: _responsive(18)),
                        TextField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                            fillColor: Appcolors.white_normal_hover,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: _responsive(45),
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolors.blue1_normal,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15))
                            ),
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: AppText.boldButton(
                                context,
                              ).copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _responsive(10),),
                        Text("Forgot password?",style: AppText.textButton(context).copyWith(color: Appcolors.white_darker),)
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(backgroundColor: Appcolors.white_normal_hover,foregroundColor: Appcolors.white_darker,elevation: 0,shape: CircleBorder(),onPressed: (){},child: Icon(Icons.arrow_back),),
      ),
    );
  }
}
