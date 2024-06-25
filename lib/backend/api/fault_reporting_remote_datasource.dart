import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../models/fault.dart';
import 'api_client.dart';

part 'fault_reporting_remote_datasource.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class FaultReportingRemoteDatasource {
  factory FaultReportingRemoteDatasource(ApiClient api) {
    final baseUrl = '${api.options.baseUrl}/applications';
    return _FaultReportingRemoteDatasource(api, baseUrl: baseUrl);
  }

  @POST('/faults')
  @MultiPart()
  Future<Fault> reportFault({
    @Field() required String description,
    @Field() required String location,
    @Field() required String status,
    @Part() required MultipartFile photo,
  });

  @GET('/faults')
  Future<List<Fault>> getFaults();
}