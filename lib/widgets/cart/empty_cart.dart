import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 120,
          ),
          SizedBox(
            height: 25,
          ),
          Text.rich(
            TextSpan(
              text: 'Your Card is ',
              children: [
                TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                    color: mainColor,
                  ),
                ),
              ],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Add items to Get Started',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: Text('Go to Home'),
          ),
        ],
      ),
    );
  }
}
