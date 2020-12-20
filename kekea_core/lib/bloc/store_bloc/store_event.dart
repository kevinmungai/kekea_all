import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'store_event.freezed.dart';

@freezed
abstract class StoreEvent with _$StoreEvent {
  const factory StoreEvent.createStore({
    @required String businessId,
  }) = _CreateStore;
}
