import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/payment/payment.dart';

part 'payment_list_status_event.freezed.dart';

@freezed
abstract class PaymentListStatusEvent with _$PaymentListStatusEvent {
  const factory PaymentListStatusEvent.listen({
    @required String businessId,
    @required String storeId,
  }) = _Listen;
  const factory PaymentListStatusEvent.stop() = _Stop;
  const factory PaymentListStatusEvent.setPresent({
    @required BuiltList<Payment> payments,
  }) = _SetPresent;
  const factory PaymentListStatusEvent.setError() = _SetError;
}
