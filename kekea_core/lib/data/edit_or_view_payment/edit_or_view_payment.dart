import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../payment/payment.dart';
import '../payment_product/payment_product.dart';

part 'edit_or_view_payment.freezed.dart';

@freezed
abstract class EditOrViewPayment with _$EditOrViewPayment {
  const factory EditOrViewPayment({
    @required Payment payment,
    BuiltList<PaymentProduct> paymentProducts,
  }) = _EditOrViewPayment;
}
