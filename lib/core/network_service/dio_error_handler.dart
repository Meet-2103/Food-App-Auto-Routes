

import 'package:dio/dio.dart';

Exception handleDioError(DioException e) {
  if (e.response != null) {
    switch (e.response?.statusCode) {
      case 400:
        return Exception('Bad Request');
      case 401:
        return Exception('Unauthorized Access');
      case 403:
        return Exception('Forbidden');
      case 404:
        return Exception('Resource Not Found');
      case 500:
        return Exception('Internal Server Error');
      case 502:
        return Exception('Bad Gateway');
      case 503:
        return Exception('Service Unavailable');
      default:
        return Exception('Something went wrong: ${e.response?.statusCode}');
    }
  } else {
    return Exception('Network error: ${e.message}');
  }
}
