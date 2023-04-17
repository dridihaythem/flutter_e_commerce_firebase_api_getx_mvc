import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/controllers/product_details_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliderNavigation extends StatelessWidget {
  ImageSliderNavigation({super.key});

  final _productDetailsController = Get.find<ProductDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        bottom: 30,
        left: (MediaQuery.of(context).size.width / 2) - 30,
        child: AnimatedSmoothIndicator(
          activeIndex: _productDetailsController.currentSliderIndex.value,
          count: 3,
          effect: ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: mainColor,
            activeDotColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
