import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngConverter implements JsonConverter<LatLng, Map<String, double>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, double> json) {
    return LatLng(json['latitude']!, json['longitude']!);
  }

  @override
  Map<String, double> toJson(LatLng instance) => <String, double>{
        'latitude': instance.latitude,
        'longitude': instance.longitude,
      };
}
