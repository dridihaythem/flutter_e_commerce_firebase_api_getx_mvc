import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AuthButtomNavigationBar extends StatelessWidget {
  const AuthButtomNavigationBar({
    super.key,
    required this.text,
    required this.underLineText,
    required this.onPressed,
  });

  final String text;
  final String underLineText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(25),
        ),
      ),
      width: double.infinity,
      height: 80,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text.rich(
            TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
              children: [
                TextSpan(
                  text: underLineText,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
