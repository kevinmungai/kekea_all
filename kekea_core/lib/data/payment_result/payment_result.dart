import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekea_core/data/payment/payment.dart';

part 'payment_result.freezed.dart';

@freezed
abstract class PaymentResult with _$PaymentResult {
  const factory PaymentResult.present({
    @required Payment payment,
  }) = _Present;
  const factory PaymentResult.absent() = _Absent;
}
