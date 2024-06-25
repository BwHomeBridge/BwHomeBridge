import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user.dart';
import 'api_client.dart';


part 'auth_remote_datasource.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthRemoteDatasource {
  factory AuthRemoteDatasource(ApiClient api) {
    final baseUrl = '${api.options.baseUrl}/auth';
    return _AuthRemoteDatasource(api, baseUrl: baseUrl);
  }

  @POST('/login')
  Future<User> login({
    @Field() required String email,
    @Field() required String password,
  });

  @POST('/registration')
  Future<User> register({
    @Field() required String email,
    @Field() required String password,
    @Field() required String name,
  });

  @POST('/logout')
  Future<HttpResponse> logout();
}