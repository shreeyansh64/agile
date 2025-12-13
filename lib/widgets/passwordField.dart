import 'package:flutter/material.dart';
import 'package:agile/styles/appColors.dart';

class PasswordField extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  final String errorText;
  final bool err;
  const PasswordField({
    super.key,
    required this.text,
    required this.controller,
    required this.errorText,
    required this.err,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      onChanged: (value) => setState(() {}),
      decoration: InputDecoration(
        label: Text(widget.text),
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
            color: widget.err ? Appcolors.blue1_normal : Colors.red,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
