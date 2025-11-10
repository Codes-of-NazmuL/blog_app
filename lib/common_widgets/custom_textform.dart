import 'package:blog_app/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextform extends StatelessWidget {
  final String validateText;
  final TextEditingController controller;
  final String hintext;
  const CustomTextform({
    super.key,
    required this.controller,
    required this.hintext,
    required this.validateText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateText;
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        fillColor: formColor,
        filled: true,
        hint: Text(hintext, style: TextStyle(color: Colors.white38)),
      ),
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
    );
  }
}
