import 'package:bw_home_bridge/backend/helper_classes/config.dart';
import 'package:dio/dio.dart';

import 'api_inperceptor.dart';

final class ApiClient extends DioMixin {
  ApiClient() {
    options = BaseOptions(
      baseUrl: Config.endpoints.active,
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 15000),
      sendTimeout: const Duration(seconds: 5000),
    );

    httpClientAdapter = HttpClientAdapter();

    interceptors.addAll(
      [
        ApiInterceptor(),
      ],
    );
  }
}
