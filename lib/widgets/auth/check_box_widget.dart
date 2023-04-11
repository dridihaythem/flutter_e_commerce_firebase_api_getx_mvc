import 'package:e_commerce_firebase_getw/controllers/auth_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({super.key});

  final _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (context) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              _controller.toggleCheckbox();
            },
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  )),
              child: _controller.isChecked
                  ? Image.asset('assets/images/check.png')
                  : Container(),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text.rich(
            TextSpan(
              text: 'I agree to the ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
