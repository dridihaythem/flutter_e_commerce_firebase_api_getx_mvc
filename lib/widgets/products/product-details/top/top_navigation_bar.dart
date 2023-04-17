import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_details_controller.dart';
import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TopNavigationBar extends StatelessWidget {
  TopNavigationBar({super.key, required this.product});

  final Product product;
  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: mainColor,
            child: IconButton(
              splashRadius: 10,
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                // size: 20,
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: mainColor,
                child: IconButton(
                  splashRadius: 10,
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
              Obx(
                () => Positioned(
                  top: -7,
                  right: -2,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(_cartController.cartItemsCount.toString()),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
