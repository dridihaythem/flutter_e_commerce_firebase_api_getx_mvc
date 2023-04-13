import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:e_commerce_firebase_getw/models/product_model.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  CartItems({
    super.key,
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;
  final _controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.network(
            product.image,
            width: 100,
            height: 130,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.decrementProductQuantity(product);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        _controller.incrementProductQuantity(product);
                      },
                      icon: Icon(
                        Icons.add_circle,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  _controller.removeProductFromCart(product);
                },
                color: Colors.red,
                icon: Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
