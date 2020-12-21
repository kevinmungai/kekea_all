import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/kekea_user/kekea_user.dart';
import 'package:kekea_core/data/payment/payment.dart';

part 'receipt_list_event.freezed.dart';

@freezed
abstract class ReceiptListEvent with _$ReceiptListEvent {
  const factory ReceiptListEvent.listen({
    @required KekeaUser kekeaUser,
  }) = _Listen;
  const factory ReceiptListEvent.stopListening() = _StopListening;
  const factory ReceiptListEvent.setPresent({
    @required BuiltList<Payment> receipts,
  }) = _SetPresent;
}
