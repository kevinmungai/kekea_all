import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/store/store.dart';

part 'store_status_event.freezed.dart';

@freezed
abstract class StoreStatusEvent with _$StoreStatusEvent {
  const factory StoreStatusEvent.listen({
    @required String businessId,
    @required String storeId,
  }) = _Listen;
  const factory StoreStatusEvent.setPresent({
    @required Store store,
  }) = _SetPresentStore;
  const factory StoreStatusEvent.setAbsent() = _SetAbsentStore;
  const factory StoreStatusEvent.stopListening() = _StopListening;
}
