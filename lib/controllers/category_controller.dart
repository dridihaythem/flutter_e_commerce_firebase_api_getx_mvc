import 'package:e_commerce_firebase_getw/models/category_modal.dart';
import 'package:e_commerce_firebase_getw/services/category_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxList<CategoryModal> categories = <CategoryModal>[].obs;
  RxBool isCategoriesLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getCategories();
  }

  Future<void> getCategories() async {
    isCategoriesLoading(true);

    categories.addAll(await CategoryService.getAllCategories());

    isCategoriesLoading(false);
  }
}
