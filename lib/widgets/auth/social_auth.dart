import 'package:e_commerce_firebase_getw/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SocialAuth extends StatelessWidget {
  SocialAuth({super.key});

  final _controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 40,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Or',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                endIndent: 40,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await _controller.loginWithFacebook();
              },
              child: Image.asset(
                'assets/images/facebook.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: () async {
                await _controller.loginWithGoogle();
              },
              child: Image.asset(
                'assets/images/google.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      ],
    );
  }
}
