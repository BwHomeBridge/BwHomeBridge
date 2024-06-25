import 'package:bw_home_bridge/backend/models/tender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_state.freezed.dart';

@freezed
class TenderState with _$TenderState {
  const factory TenderState.initial() = _Initial;
  const factory TenderState.loading() = _Loading;
  const factory TenderState.loaded(List<Tender> tenders) = _Loaded;
  const factory TenderState.error(String message) = _Error;
}
