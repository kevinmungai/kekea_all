import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@Freezed(unionKey: c.paymentMethodUnionKey)
abstract class PaymentMethod implements _$PaymentMethod {
  const factory PaymentMethod.cash({
    @JsonKey(name: "amount_given") BigInt amountGiven,
    @JsonKey(name: "total") BigInt total,
    @JsonKey(name: "change") BigInt change,
  }) = _Cash;

  const factory PaymentMethod.mpesa({
    @JsonKey(name: "ref_number") String refNumber,
  }) = _Mpesa;

  const factory PaymentMethod.card({
    @JsonKey(name: "ref_number") String refNumber,
  }) = _Card;

  const factory PaymentMethod.credit({
    @JsonKey(name: "customer_phone") String customerPhone,
  }) = _Credit;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  static String toDisplayText(PaymentMethod paymentMethod) {
    return paymentMethod.map(
      cash: (_) => "CASH",
      mpesa: (_) => "MPESA",
      card: (_) => "CARD Recpt",
      credit: (_) => "STORE CREDIT",
    );
  }

  static String toDisplayTextPayment(PaymentMethod paymentMethod) {
    return paymentMethod.map(
      cash: (_) => "CASH",
      mpesa: (_) => "MPESA",
      card: (_) => "CARD",
      credit: (_) => "STORE CREDIT",
    );
  }
}
