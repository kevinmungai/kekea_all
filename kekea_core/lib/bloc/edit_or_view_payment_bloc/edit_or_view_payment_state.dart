import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
part 'edit_or_view_payment_state.freezed.dart';

@freezed
abstract class EditOrViewPaymentState with _$EditOrViewPaymentState {
  const factory EditOrViewPaymentState.present({
    @required EditOrViewPayment editOrViewPayment,
  }) = _EditOrViewPaymentState;
  const factory EditOrViewPaymentState.absent() = _Initial;
}
