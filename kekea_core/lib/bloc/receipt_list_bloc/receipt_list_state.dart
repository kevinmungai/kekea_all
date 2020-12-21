import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/payment/payment.dart';

part 'receipt_list_state.freezed.dart';

@freezed
abstract class ReceiptListState with _$ReceiptListState {
  const factory ReceiptListState.absent() = _Absent;
  const factory ReceiptListState.present({
    @required BuiltList<Payment> receipts,
  }) = _Present;
}
