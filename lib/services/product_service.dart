import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/utils/constants.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<Product>> getAllProducts() async {
    var response = await http.get(Uri.parse('${Constants.baseUrl}/products'));

    if (response.statusCode == 200) {
      return Product.productsFromJson(response.body);
    }

    return throw Exception('Failed to load products');
  }
}
