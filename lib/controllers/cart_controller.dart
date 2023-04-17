import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/widgets/home/card_items.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt cartItemsCount = 0.obs;

  void addProductToCart(Product product) {
    if (cartItems.any((el) => el.product.id == product.id)) {
      cartItems.firstWhere((el) => el.product.id == product.id).quantity += 1;
    } else {
      cartItems.add(CartItem(product: product, quantity: 1));
    }
    UpdatetotalPrice();
    print('hi');
  }

  void removeProductFromCart(Product product) {
    cartItems.removeWhere((el) => el.product.id == product.id);
    UpdatetotalPrice();
  }

  void incrementProductQuantity(Product product) {
    cartItems.firstWhere((el) => el.product.id == product.id).quantity += 1;

    cartItems.refresh();
    UpdatetotalPrice();
  }

  void decrementProductQuantity(Product product) {
    if (cartItems.firstWhere((el) => el.product.id == product.id).quantity ==
        1) {
      removeProductFromCart(product);
      return;
    }
    cartItems.firstWhere((el) => el.product.id == product.id).quantity -= 1;
    cartItems.refresh();
    UpdatetotalPrice();
  }

  void UpdatetotalPrice() {
    double total = 0;
    cartItems.forEach((element) {
      total += element.product.price * element.quantity;
    });
    print(total);
    totalPrice(total);
    updateCartItemsCount();
  }

  updateCartItemsCount() {
    int count = 0;
    cartItems.forEach((element) {
      count += element.quantity;
    });
    cartItemsCount(count);
  }
}

class CartItem {
  final Product product;
  late int quantity;

  CartItem({required this.product, required this.quantity});
}
