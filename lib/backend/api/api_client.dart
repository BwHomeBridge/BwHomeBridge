import 'package:bw_home_bridge/backend/helper_classes/config.dart';
import 'package:dio/dio.dart';

import '../../utils/debugBro.dart';
import 'api_inperceptor.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    /// dio base settings
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      baseUrl: Config.endpoints.active,
    );

    _dio = Dio(options);
    _dio.interceptors.add(ApiInterceptor());
  }

  ///
  Future<Response> getRequest(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      // set  for requests with custom headers
      Options? options;
      if (headers != null) {
        options = Options(headers: headers);
      }

      response = await _dio.get(
        path,
        options: options,
      );

      return response;
    } catch (error) {
      logger.w(error);

      rethrow;
    }
  }

  ///
  Future<Response> postRequest(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    Response response;
    try {
      Options? options;
      if (headers != null) {
        options = Options(headers: headers);
      }

      response = await _dio.post(
        path,
        data: data,
        options: options,
      );

      return response;
    } catch (error) {
      logger.e(error);
      rethrow;
    }
  }

  ///
  Future<Response> deleteRequest(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    Response response;

    try {
      // set  for requests with custom headers
      Options? options;
      if (headers != null) {
        options = Options(headers: headers);
      }

      response = await _dio.delete(
        path,
        options: options,
      );

      return response;
    } catch (error) {
      logger.w(error);
      rethrow;
    }
  }

  ///
  Future<Response> putRequest(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      // set  for requests with custom headers
      Options? options;
      if (headers != null) {
        options = Options(headers: headers);
      }

      response = await _dio.put(
        path,
        data: data,
        options: options,
      );

      return response;
    } catch (error) {
      logger.e(error);

      rethrow;
    }
  }
}
