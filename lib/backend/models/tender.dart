import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender.freezed.dart';
part 'tender.g.dart';

@freezed
class Tender with _$Tender {
  factory Tender({
    required String id,
    required String title,
    required String status,
    required DateTime deadline,
  }) = _Tender;

  factory Tender.fromJson(Map<String, dynamic> json) => _$TenderFromJson(json);
}
