import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/payment_method/payment_method.dart';

part 'payment_input_event.freezed.dart';

@freezed
abstract class PaymentInputEvent with _$PaymentInputEvent {
  const factory PaymentInputEvent.selectPaymentMethod({
    @required PaymentMethod paymentMethod,
  }) = _PaymentMethod;

  const factory PaymentInputEvent.changeCashAmountGiven({
    @required BigInt amountGiven,
  }) = _ChangeCashAmountGiven;

  const factory PaymentInputEvent.changeMpesaRefNumber({
    @required String mpesaRefNumber,
  }) = _ChangeMpesaRefNumber;

  const factory PaymentInputEvent.changeCardRefNumber({
    @required String cardRefNumber,
  }) = _ChangeCardRefNumber;

  const factory PaymentInputEvent.changeCreditCustomerPhone({
    @required String customerPhone,
  }) = _ChangeCreditCustomerPhone;

  const factory PaymentInputEvent.changeCustomerPhone({
    @required String customerPhone,
  }) = _ChangeCustomerPhone;

  const factory PaymentInputEvent.submit() = _Submit;
}
