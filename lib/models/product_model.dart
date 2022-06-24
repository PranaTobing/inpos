import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.data,
  });

  List<Product> data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.img,
    required this.harga,
  });

  int id;
  String category;
  String title;
  String img;
  int harga;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        category: json["category"],
        title: json["title"],
        img: json["img"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "title": title,
        "img": img,
        "harga": harga,
      };
}
