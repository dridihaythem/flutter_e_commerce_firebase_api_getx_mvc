import 'package:e_commerce_firebase_getw/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CartButtomBar extends StatelessWidget {
  CartButtomBar({
    super.key,
    required this.buttonText,
    required this.priceText,
    required this.price,
    required this.onPressed,
  });

  final String buttonText;
  final String priceText;
  final double price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                priceText,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$ ${price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Expanded(
            child: Container(
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: onPressed,
                label: Text(buttonText),
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
