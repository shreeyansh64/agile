import 'package:agile/styles/appColors.dart';
import 'package:flutter/material.dart';

class inputField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final String errorText;
  final bool err;

  const inputField({
    super.key,
    required this.text,
    required this.controller,
    required this.errorText,
    required this.err,
  });

  @override
  State<inputField> createState() => _inputFieldState();
}

class _inputFieldState extends State<inputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value) => setState(() {}),
      decoration: InputDecoration(
        label: Text(widget.text),
        labelStyle: TextStyle(color: Colors.black),
        fillColor: Appcolors.white_normal_hover,
        filled: true,
        errorText: widget.err ? null : widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.err ? Colors.white : Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.err ? Appcolors.blue1_normal : Colors.red, width: 2),
        ),
      ),
    );
  }
}
