import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_details_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SizeList extends StatelessWidget {
  SizeList({super.key});

  final _productDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            _productDetailsController.currentSize(index);

            print(index);
            print(_productDetailsController.currentSize.value);
          },
          child: Obx(
            () => Container(
              width: 45,
              height: 28,
              decoration: BoxDecoration(
                color: _productDetailsController.currentSize.value == index
                    ? mainColor.withOpacity(0.65)
                    : (!Get.isDarkMode
                        ? Colors.transparent
                        : Colors.white.withOpacity(0.65)),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(9),
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  _productDetailsController.sizeList[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: _productDetailsController.sizeList.length,
      ),
    );
  }
}
