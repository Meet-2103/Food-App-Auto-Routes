import 'package:dio/dio.dart';
import 'package:food_app_auto_router/core/text_constants.dart';


class ApiClient{

  final Dio dio=Dio(BaseOptions(baseUrl: TextConstants.baseUrl));

  Future<Map<String,dynamic>> getProducts()async{     //return type check
    try {
      final response = await dio.get(TextConstants.productEndPoint);
      return response.data;
    }
    catch(e){
      throw Exception(TextConstants.tabs1);
    }
  }

  Future<Map<String,dynamic>> getProductById(int id)async{
    try {
      final response = await dio.get("${TextConstants.productEndPoint}$id");
      return response.data;
    }
    catch(e){
      throw Exception(TextConstants.tabs1);
    }
  }
}