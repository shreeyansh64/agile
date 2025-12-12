import 'package:agile/styles/appColors.dart';
import 'package:flutter/material.dart';

class inputField extends StatelessWidget {
  final String text;
  const inputField({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(text),
        labelStyle: TextStyle(color: Colors.black),
        fillColor: Appcolors.white_normal_hover,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: Appcolors.blue1_normal),
        ),
      ),
    );
  }
}
