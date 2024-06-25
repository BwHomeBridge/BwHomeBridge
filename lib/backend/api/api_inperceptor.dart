import 'dart:async';

import 'package:dio/dio.dart';

import '../../utils/debugBro.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options, handler) async {
    logger.e(options.uri);
    try {
      // options = options.copyWith(
      //   headers: {
      //     'Authorization': 'Basic $authToken',
      //   },
      // );
      return handler.next(options); //
    } catch (e) {
      logger.e(e);
      return handler.next(options); //
    }
  }

  @override
  Future<dynamic> onResponse(Response response, handler) async {
    try {
      print(
          '[${response.requestOptions.method}] STATUS: ${response.statusCode} ${response.requestOptions.uri}');
      // logger.wtf(response.data);
    } catch (e) {
      logger.e(e);
    }

    return handler.next(response);
  }
}
