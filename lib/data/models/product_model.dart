import 'package:food_app_auto_router/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.description,
    required super.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
    );
  }
}
