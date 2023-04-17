import 'package:e_commerce_firebase_getw/controllers/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ColorPicker extends StatelessWidget {
  ColorPicker({super.key});

  final _productDetailsController = Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      bottom: 50,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        height: 200,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: _productDetailsController.colors.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              _productDetailsController.currentColor(index);
            },
            child: Obx(
              () => CircleAvatar(
                backgroundColor:
                    _productDetailsController.currentColor.value == index
                        ? Colors.white
                        : Colors.transparent,
                radius: 17,
                child: CircleAvatar(
                  backgroundColor: _productDetailsController.colors[index],
                  radius: 15,
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 7,
          ),
        ),
      ),
    );
  }
}
