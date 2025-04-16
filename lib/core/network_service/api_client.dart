// api_client.dart

import 'package:dio/dio.dart';
import 'package:food_app_auto_router/core/text_constants.dart';

import 'dio_error_handler.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: TextConstants.baseUrl));

  Future<Map<String, dynamic>> getProducts() async {
    try {
      final response = await dio.get(TextConstants.productEndPoint);
      return response.data;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getProductById(int id) async {
    try {
      final response = await dio.get("${TextConstants.productEndPoint}$id");
      return response.data;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
