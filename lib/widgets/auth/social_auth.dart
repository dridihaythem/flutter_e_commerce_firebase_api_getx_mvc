import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

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
            Image.asset(
              'assets/images/facebook.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 30,
            ),
            Image.asset(
              'assets/images/google.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ],
        )
      ],
    );
  }
}
