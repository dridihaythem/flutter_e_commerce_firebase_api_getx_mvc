import 'package:e_commerce_firebase_getw/controllers/category_controller.dart';
import 'package:e_commerce_firebase_getw/models/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  final CategoryController _categoryController = Get.find<CategoryController>();
  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Obx(
        () => _categoryController.isCategoriesLoading.value
            ? CircularProgressIndicator()
            : ListView.separated(
                shrinkWrap: true,
                itemCount: _categoryController.categories.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _categoryController.categories[index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                        categoryImages[index],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
