import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../models/tender.dart';
import 'api_client.dart';

part 'tender_remote_datasource.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class TenderRemoteDatasource {
  factory TenderRemoteDatasource(ApiClient api) {
    final baseUrl = '${api.options.baseUrl}/tenders';
    return _TenderRemoteDatasource(api, baseUrl: baseUrl);
  }

  @GET('/tenders')
  Future<List<Tender>> getTenders();
}