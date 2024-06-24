import 'package:bw_home_bridge/backend/helper_classes/lat_lng_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'property.freezed.dart';
part 'property.g.dart';

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
