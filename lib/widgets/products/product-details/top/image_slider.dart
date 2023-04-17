import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_details_controller.dart';
import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/screens/product_details_screen.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({
    super.key,
    required this.product,
  });

  final Product product;

  var _controller = CarouselController();

  final _cartController = Get.find<CartController>();
  final _productDetailsController = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.5,
        autoPlay: true,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          _productDetailsController.currentSliderIndex(index);
        },
      ),
      carouselController: _controller,
      itemBuilder: (context, index, realIndex) => Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(
              product.image,
            ),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
