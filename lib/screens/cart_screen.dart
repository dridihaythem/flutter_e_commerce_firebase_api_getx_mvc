import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:e_commerce_firebase_getw/widgets/cart/cart_bottom_bar.dart';
import 'package:e_commerce_firebase_getw/widgets/cart/cart_item.dart';
import 'package:e_commerce_firebase_getw/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});

  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () => _controller.cartItems.length == 0
            ? EmptyCard()
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CartItems(
                        product: _controller.cartItems[index].product,
                        quantity: _controller.cartItems[index].quantity,
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: _controller.cartItems.length,
                    ),
                  ),
                  CartButtomBar(),
                ],
              ),
      ),
    );
  }
}
