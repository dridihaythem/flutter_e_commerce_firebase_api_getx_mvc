import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.product});

  final _cartController = Get.find<CartController>();
  final _controller = Get.find<ProductController>();
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => IconButton(
                    splashRadius: 1,
                    onPressed: () {
                      _controller.toggleFavorites(product);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: _controller.isFavorite(product)
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ),
                IconButton(
                  splashRadius: 1,
                  onPressed: () {
                    _cartController.addProductToCart(product);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${product.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(product.rating['rate'].toString()),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
