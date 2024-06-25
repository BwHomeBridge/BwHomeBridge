import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender.freezed.dart';
part 'tender.g.dart';

Tender deserializeTender(Map<String, dynamic> map) =>Tender.fromJson(map);

Map<String, dynamic> serializeTender(tender) => tender.toJson();

List<Tender> deserializeTenderList(List<Map<String, dynamic>> json) =>
    json.map((e) => Tender.fromJson(e)).toList();

List<Map<String, dynamic>> serializeTenderList(List<Tender> tenders) =>
    tenders.map((e) => e.toJson()).toList();

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
