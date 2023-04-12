import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxList<Product> favorites = <Product>[].obs;

  RxBool isLoading = true.obs;

  void onInit() {
    super.onInit();

    getProducts();
  }

  getProducts() async {
    isLoading(true);

    var products = await ProductService.getAllProducts();

    this.products.addAll(products);

    isLoading(false);
  }

  toggleFavorites(Product product) {
    if (isFavorite(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favorites.contains(product);
  }
}
