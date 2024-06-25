import 'package:freezed_annotation/freezed_annotation.dart';

part 'fault.freezed.dart';
part 'fault.g.dart';


Fault deserializeFault(Map<String, dynamic> map) => Fault.fromJson(map);

Map<String, dynamic> serializeProperty(Fault fault) => fault.toJson();

List<Fault> deserializeFaultList(List<Map<String, dynamic>> json) =>
    json.map((e) => Fault.fromJson(e)).toList();

List<Map<String, dynamic>> serializeFaultList(List<Fault> faults) =>
    faults.map((e) => e.toJson()).toList();

@freezed
class Fault with _$Fault {
  factory Fault({
    required String id,
    required String referenceNumber,
    required String assignedTeam,
    required DateTime description,
    required String location,
    required String photo,
    required String status,
    required String dateReported,
  }) = _Fault;

  factory Fault.fromJson(Map<String, dynamic> json) =>
      _$FaultFromJson(json);
}
