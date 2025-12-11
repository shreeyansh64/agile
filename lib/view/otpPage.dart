import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:agile/widgets/blueButton.dart';
import 'package:agile/widgets/floatBackButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';

class otpPage extends StatefulWidget {
  const otpPage({super.key});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
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
            Center(
              child: Padding(
                padding:  EdgeInsets.all(_responsive(20)),
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
                          "Verify your identiity to continue. Enter the OTP",
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
                    ),
                    SizedBox(height: _responsive(75)),
                    Column(
                      children: [
                        BlueButton(text: "Verify OTP",function: (){},),
                        SizedBox(height: _responsive(20),),
                       Align(alignment: Alignment.centerLeft,child:  TextButton(onPressed: () {}, child: Text("Resend OTP",style: AppText.textButton(context).copyWith(color: Appcolors.white_darker),)),)
                      ],
                    ),
                    Spacer(),
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
