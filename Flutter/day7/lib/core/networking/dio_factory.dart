import 'package:day7/core/networking/api_constants.dart';
import 'package:dio/dio.dart' show Dio, BaseOptions, Response, Options;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static late Dio _dio;

  // Singleton Pattern
  static void init() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    _dio.interceptors.add(
      PrettyDioLogger(
        enabled: true,
        error: true,
        requestBody: true,
        responseBody: true,
        request: true,
        requestHeader: true,
        compact: true,
      ),
    );
  }

  static Future<Response<dynamic>> postData(
    String endpoint, {
    Map<String, dynamic>? data,
  }) async {
    final response = await _dio.post(endpoint, data: data);
    return response;
  }

  static Future<Response> getData(String endpoint, String token) async {
    final response = await _dio.get(
      endpoint,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response;
  }
}
