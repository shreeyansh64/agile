import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
      textStyle: AppText.heading(context)

    );


    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(_responsive(20)),
          child: Stack(
            children: [
              Column(
              children: [
                Spacer(),
                Pinput(
                  length: 6,
                  defaultPinTheme: otpTheme,
                  focusedPinTheme: otpTheme.copyWith(
                    decoration: BoxDecoration(
                      border: Border.all(color: Appcolors.blue1_normal,width: 2),
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolors.white_normal_hover,
                    )
                  ),
                ),
                Spacer(),
              ],
            ),
            ],
          ),
        )
      ),
    );
  }
}