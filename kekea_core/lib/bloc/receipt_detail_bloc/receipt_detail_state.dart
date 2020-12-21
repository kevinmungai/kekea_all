import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_product/payment_product.dart';

part 'receipt_detail_state.freezed.dart';

@freezed
abstract class ReceiptDetailState with _$ReceiptDetailState {
  const factory ReceiptDetailState.initial() = _Initial;
  const factory ReceiptDetailState.present({
    @required Payment payment,
    BuiltList<PaymentProduct> paymentProducts,
  }) = _Present;
  const factory ReceiptDetailState.paymentAbsent() = _PaymentAbsent;
}
