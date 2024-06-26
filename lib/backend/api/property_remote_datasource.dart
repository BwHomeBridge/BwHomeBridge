import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';

import '../models/property.dart';
import 'api_client.dart';

part 'property_remote_datasource.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class PropertyRemoteDatasource {
  factory PropertyRemoteDatasource(ApiClient api) {
    final baseUrl = '${api.options.baseUrl}/applications';
    return _PropertyRemoteDatasource(api, baseUrl: baseUrl);
  }

  @GET('/properties/')
  // Query parameters are optional
  @Query('location')
  @Query('minPrice')
  @Query('maxPrice')
  @Query('minBedrooms')
  @Query('maxBedrooms')
  @Query('listing_type')
  @Query('property_type')
  Future<List<Property>> getProperties({
    String? location,
    double? minPrice,
    double? maxPrice,
    int? minBedrooms,
    int? maxBedrooms,
    String? listingType,
    String? propertyType,
  });

  @GET('/properties/{id}')
  Future<Property> getProperty(@Path('id') String id);

  @PUT('/properties/{id}')
  Future<Property> updateProperty(
      @Path('id') String id, @Body() Property property);

  @DELETE('/properties/{id}')
  Future<Property> deleteProperty(@Path('id') String id);
}
