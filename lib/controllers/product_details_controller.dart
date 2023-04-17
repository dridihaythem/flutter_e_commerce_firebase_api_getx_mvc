import 'dart:ui';

import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  RxInt currentSliderIndex = 0.obs;
  RxInt currentColor = 0.obs;
  RxInt currentSize = 0.obs;

  final List<Color> colors = const [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5
  ];

  final List<String> sizeList = const [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
}
