import 'package:e_commerce_firebase_getw/controllers/auth_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({super.key, required this.title});

  final Widget title;
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
          title
        ],
      );
    });
  }
}
