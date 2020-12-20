import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/payment/payment.dart';

part 'payment_list_status_state.freezed.dart';

@freezed
abstract class PaymentListStatusState with _$PaymentListStatusState {
  const factory PaymentListStatusState.loading() = _Loading;
  const factory PaymentListStatusState.present({
    @required BuiltList<Payment> payments,
  }) = _Present;
}
