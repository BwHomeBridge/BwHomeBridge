import 'package:freezed_annotation/freezed_annotation.dart';

part 'rent_payment.freezed.dart';
part 'rent_payment.g.dart';

@freezed
class RentPayment with _$RentPayment {
  const factory RentPayment({
    required int id,
    required DateTime date,
    required double amount,
  }) = _RentPayment;

  factory RentPayment.fromJson(Map<String, dynamic> json) =>
      _$RentPaymentFromJson(json);
}
