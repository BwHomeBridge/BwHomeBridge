import 'package:bw_home_bridge/backend/models/user_property.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_properties_state.freezed.dart';

@freezed
class MyPropertiesState with _$MyPropertiesState {
  const factory MyPropertiesState.initial() = _Initial;
  const factory MyPropertiesState.loading() = _Loading;
  const factory MyPropertiesState.loaded(List<UserProperty> properties) =
      _Loaded;
  const factory MyPropertiesState.error(String message) = _Error;
}
