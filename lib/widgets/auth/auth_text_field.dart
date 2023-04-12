import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.validation,
    required this.prefixIcon,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final bool obscureText;
  final Function validation;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validation(value),
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
