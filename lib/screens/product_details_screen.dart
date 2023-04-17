import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_details_controller.dart';
import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:e_commerce_firebase_getw/widgets/global/cart_bottom_bar.dart';
import 'package:e_commerce_firebase_getw/widgets/products/product-details/product_top.dart';
import 'package:e_commerce_firebase_getw/widgets/products/product-details/size_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  final _productController = Get.find<ProductController>();
  final _productDetailsController = Get.put(ProductDetailsController());
  final _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 16,
              left: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTop(product: product),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontSize: 25,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                '2.75',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              RatingBarIndicator(
                                rating: 2.75,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 25.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Obx(
                      () => CircleAvatar(
                        radius: 23,
                        backgroundColor: _productController.isFavorite(product)
                            ? Colors.red
                            : Colors.grey,
                        child: IconButton(
                          splashRadius: 10,
                          onPressed: () {
                            _productController.toggleFavorites(product);
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ReadMoreText(
                  product.description,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizeList(),
                SizedBox(
                  height: 15,
                ),
                CartButtomBar(
                  buttonText: 'Add to cart',
                  priceText: 'Price',
                  price: product.price,
                  onPressed: () {
                    _cartController.addProductToCart(product);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
