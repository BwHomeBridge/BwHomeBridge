import 'package:bw_home_bridge/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_filters.freezed.dart';
part 'property_filters.g.dart';

@freezed
class PropertyFilters with _$PropertyFilters {
  factory PropertyFilters({
    @Default(PropertyType.all) PropertyType propertyType,
  }) = _PropertyFilters;

  factory PropertyFilters.fromJson(Map<String, dynamic> json) =>
      _$PropertyFiltersFromJson(json);
}
