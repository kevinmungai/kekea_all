import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/payment/payment.dart';
import '../../data/payment_product/payment_product.dart';

part 'edit_or_view_payment_event.freezed.dart';

@freezed
abstract class EditOrViewPaymentEvent with _$EditOrViewPaymentEvent {
  const factory EditOrViewPaymentEvent.listenToPaymentProducts({
    @required Payment payment,
  }) = _ListenToPaymentProducts;
  const factory EditOrViewPaymentEvent.setPaymentProductsPresent({
    @required BuiltList<PaymentProduct> paymentProducts,
    @required Payment payment,
  }) = _SetPaymentProductsPresent;
  const factory EditOrViewPaymentEvent.setPaymentPresent({
    @required Payment payment,
  }) = _SetPaymentPresent;
  const factory EditOrViewPaymentEvent.setError({
    Error error,
    StackTrace stackTrace,
  }) = _SetError;
  const factory EditOrViewPaymentEvent.stopListening() = _StopListening;
}
