import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/customer/customer.dart';
import '../../data/payment_method/payment_method.dart';

part 'payment_input_state.freezed.dart';

@freezed
abstract class PaymentInputState with _$PaymentInputState {
  const factory PaymentInputState({
    @required PaymentMethod paymentMethod,
    @required Customer customer,
  }) = _Current;
}
