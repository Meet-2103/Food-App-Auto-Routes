import 'package:food_app_auto_router/data/models/product_model.dart';
import '../../core/network_service/api_client.dart';
import '../../core/text_constants.dart';

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
}
//extract constants