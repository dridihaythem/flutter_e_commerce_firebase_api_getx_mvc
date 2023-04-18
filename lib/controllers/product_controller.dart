import 'dart:convert';

import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> searchedProducts = <Product>[].obs;
  RxList<Product> favorites = <Product>[].obs;

  TextEditingController searchController = TextEditingController();

  RxBool isLoading = true.obs;

  RxBool isSearchMode = false.obs;

  var storage = GetStorage();

  void onInit() async {
    super.onInit();

    getProducts();

    var favorites = await storage.read('favorites');
    this.favorites.addAll(Product.productsFromJson(favorites).toList());
  }

  getProducts() async {
    isLoading(true);

    var products = await ProductService.getAllProducts();

    this.products.addAll(products);

    isLoading(false);
  }

  toggleFavorites(Product product) async {
    if (isFavorite(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }

    await storage.write('favorites',
        jsonEncode(favorites.map((element) => element.toJson()).toList()));
  }

  bool isFavorite(Product product) {
    return favorites.where((p) => p.id == product.id).isNotEmpty;
  }

  void search(String value) async {
    isSearchMode(true);
    isLoading(true);
    searchedProducts.clear();
    searchedProducts.addAll(
      products
          .where((el) => el.title.toLowerCase().contains(value.toLowerCase()))
          .toList(),
    );
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);
  }

  void clearSearch() async {
    isLoading(true);

    searchedProducts.clear();
    searchController.clear();
    await Future.delayed(Duration(seconds: 2));
    isSearchMode(false);
    isLoading(false);
  }
}
