import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/widgets/products/product-details/top/color_picker.dart';
import 'package:e_commerce_firebase_getw/widgets/products/product-details/top/image_slider.dart';
import 'package:e_commerce_firebase_getw/widgets/products/product-details/top/image_slider_navigation.dart';
import 'package:e_commerce_firebase_getw/widgets/products/product-details/top/top_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductTop extends StatelessWidget {
  const ProductTop({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageSlider(
          product: product,
        ),
        ImageSliderNavigation(),
        TopNavigationBar(
          product: product,
        ),
        ColorPicker(),
      ],
    );
  }
}
