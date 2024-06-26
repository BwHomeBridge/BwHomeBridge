import 'package:bw_home_bridge/backend/helper_classes/lat_lng_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'user_property.freezed.dart';
part 'user_property.g.dart';

@freezed
class UserProperty with _$UserProperty {
  const factory UserProperty({
    required int id,
    required String title,
    @LatLngConverter() required LatLng location,
    required String price,
    List<String>? images,
    required String photo,
    String? description,
    String? listingType,
    String? propertyType,
    bool? isForSale,
  }) = _UserProperty;

  factory UserProperty.fromJson(Map<String, dynamic> json) =>
      _$UserPropertyFromJson(json);
}
