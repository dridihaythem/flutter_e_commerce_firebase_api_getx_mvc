import 'dart:convert';

const categoryImages = const [
  'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
  'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg',
  'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
  'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg'
];

class CategoryModal {
  late String name;

  CategoryModal({required this.name});

  static List<CategoryModal> categoriesFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<CategoryModal>.from(
      data.map(
        (item) => CategoryModal(
          name: item,
        ),
      ),
    );
  }
}
