import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/payment/payment.dart';

part 'payment_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState.paymentCreated(Payment payment) = _PaymentCreated;
  const factory PaymentState.initial() = _Initial;
  const factory PaymentState.businessPersonDoesNotExist() =
      _BusinessPersonDoesNotExist;
  const factory PaymentState.paymentProductsCreated() = _PaymentProductsCreated;
  const factory PaymentState.productsUpdated() = _ProductsUpdated;
}
