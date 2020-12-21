import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';

part 'receipt_detail_event.freezed.dart';

@freezed
abstract class ReceiptDetailEvent with _$ReceiptDetailEvent {
  const factory ReceiptDetailEvent.listenByPayment({
    @required Payment payment,
  }) = _Listen;
  const factory ReceiptDetailEvent.stopListening() = _StopListening;
  const factory ReceiptDetailEvent.listenByUri({
    @required Uri uri,
  }) = _ListenByUri;
  const factory ReceiptDetailEvent.setPayment({
    @required Payment payment,
  }) = _SetPayment;
  const factory ReceiptDetailEvent.setPaymentProducts({
    @required BuiltList<PaymentProduct> paymentProduct,
  }) = _SetPaymentProducts;
}
