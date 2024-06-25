import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(json['lat']!, json['lng']!);
  }

  @override
  Map<String, double> toJson(LatLng instance) => <String, double>{
        'lat': instance.latitude,
        'lng': instance.longitude,
      };
}
