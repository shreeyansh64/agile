import 'package:agile/styles/appColors.dart';
import 'package:flutter/material.dart';

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
        errorText: widget.err ? null : widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.err ? Colors.white : Colors.red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.err ? Appcolors.blue1_normal : Colors.red, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
      ),
    );
  }
}
