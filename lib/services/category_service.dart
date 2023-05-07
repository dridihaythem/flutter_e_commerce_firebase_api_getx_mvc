import 'package:e_commerce_firebase_getw/models/category_modal.dart';
import 'package:e_commerce_firebase_getw/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static Future<List<CategoryModal>> getAllCategories() async {
    var response =
        await http.get(Uri.parse('${Constants.baseUrl}/products/categories'));

    if (response.statusCode == 200) {
      return CategoryModal.categoriesFromJson(response.body);
    }

    return throw Exception('Failed to load products');
  }
}
