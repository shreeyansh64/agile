import 'package:agile/styles/appColors.dart';
import 'package:flutter/material.dart';

class floatBackButton extends StatelessWidget {
  const floatBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
          backgroundColor: Appcolors.white_normal_hover,
          foregroundColor: Appcolors.white_darker,
          elevation: 0,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        );
  }
}