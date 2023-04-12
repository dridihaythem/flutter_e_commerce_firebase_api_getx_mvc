import 'package:e_commerce_firebase_getw/controllers/product_controller.dart';
import 'package:e_commerce_firebase_getw/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final _controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => _controller.favorites.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 100,
                    ),
                    Text(
                      'No Favorites',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) => Container(
                  height: 100,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          _controller.favorites[index].image,
                          fit: BoxFit.fill,
                          width: 100,
                          height: 100,
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
                                _controller.favorites[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$ ${_controller.favorites[index].price}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            _controller
                                .toggleFavorites(_controller.favorites[index]);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(
                  height: 30,
                  thickness: 3,
                ),
                itemCount: _controller.favorites.length,
              ),
      ),
    );
  }
}
