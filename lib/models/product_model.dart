import 'dart:convert';

class Product {
  late final int id;
  late final String title;
  late final double price;
  late final String description;
  late final String category;
  late final String image;
  late final Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toDouble();
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": {
          "rate": rating['rate'],
          "count": rating['count'],
        },
      };

  static List<Product> productsFromJson(String jsonData) {
    final data = json.decode(jsonData);
    return List<Product>.from(data.map((item) => Product.fromJson(item)));
  }
}
