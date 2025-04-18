import 'package:food_app_auto_router/data/models/product_model.dart';
import 'package:food_app_auto_router/core/network_service/api_client.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

class ProductRemoteDataSource {
  final ApiClient apiClient;

  ProductRemoteDataSource({required this.apiClient});

  Future<List<ProductModel>> fetchProductItems() async {
    final response = await apiClient.getProducts();
    if (response['status'] == TextConstants.success) {
      final List<dynamic> productsList = response['products'];
      return productsList.map((json) {
        if (json is Map<String, dynamic>) {
          return ProductModel.fromJson(json);
        } else {
          throw FormatException(TextConstants.expectedAJsonError);
        }
      }).toList();
    } else {
      throw FormatException('Expected a successful response with products');
    }
  }

  Future<List<ProductModel>> fetchProductItemsById(int id) async {
    final response = await apiClient.getProductById(id);
    if (response['status'] == TextConstants.success) {
      final dynamic productJson = response['product'];
      if (productJson is Map<String, dynamic>) {
        final product = ProductModel.fromJson(productJson);
        return [product];
      } else {
        throw FormatException(TextConstants.expectedAJsonError);
      }
    } else {
      throw FormatException('Expected a successful response with product');
    }
  }

}
//extract constants