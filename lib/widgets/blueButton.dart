import 'package:agile/styles/appColors.dart';
import 'package:agile/styles/appText.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const BlueButton({super.key,required this.text,required this.function});

  @override
  Widget build(BuildContext context) {
    double _responsive(num) {
      final width = MediaQuery.widthOf(context);
      return (width / 360) * num;
    }

    return SizedBox(
      height: _responsive(45),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolors.blue1_normal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
        ),
        onPressed: function,
        child: Text(
          this.text,
          style: AppText.boldButton(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
