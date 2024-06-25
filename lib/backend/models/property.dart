import 'package:bw_home_bridge/backend/helper_classes/lat_lng_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'property.freezed.dart';
part 'property.g.dart';

Property deserializeProperty(Map<String, dynamic> map) => Property.fromJson(map);

Map<String, dynamic> serializeProperty(Property property) => property.toJson();

List<Property> deserializePropertyList(List<Map<String, dynamic>> json) =>
    json.map((e) => Property.fromJson(e)).toList();

List<Map<String, dynamic>> serializePropertyList(List<Property> properties) =>
    properties.map((e) => e.toJson()).toList();

@freezed
class Property with _$Property {
  factory Property({
    required String id,
    required String name,
    @LatLngConverter() required LatLng location,
    required double price,
    required List<String> images,
    String? description,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}
