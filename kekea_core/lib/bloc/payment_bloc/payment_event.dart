import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/payment/payment.dart';
import '../../data/payment_product/payment_product.dart';

part 'payment_event.freezed.dart';

@freezed
abstract class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.businessPersonDoesExist() =
      _BusinessPersonDoesNotExist;

  const factory PaymentEvent.paymentCreated(Payment payment) = _PaymentCreated;
  const factory PaymentEvent.paymentProductsSaved(
    BuiltList<PaymentProduct> paymentProducts,
  ) = _PaymentProductsSaved;
  const factory PaymentEvent.productsUpdated() = _ProductsUpdated;
}
