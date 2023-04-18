import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/screens/product_details_screen.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:e_commerce_firebase_getw/widgets/home/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  final _controller = Get.find<ProductController>();
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(
              color: mainColor,
            ))
          : _controller.isSearchMode.value &&
                      _controller.searchedProducts.isEmpty ||
                  _controller.products.isEmpty
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Icon(
                        Icons.search_off,
                        size: 150,
                        color: mainColor,
                      ),
                      Text(
                        'No Products Found',
                        style: TextStyle(
                          fontSize: 25,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Try another search term',
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _controller.isSearchMode.value
                      ? _controller.searchedProducts.length
                      : _controller.products.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 25,
                    childAspectRatio: 0.7,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) => ProductItem(
                    product: _controller.isSearchMode.value
                        ? _controller.searchedProducts[index]
                        : _controller.products[index],
                  ),
                ),
    );
  }
}
