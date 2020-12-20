import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/store/store.dart';

part 'store_state.freezed.dart';

@freezed
abstract class StoreState with _$StoreState {
  const factory StoreState.initial() = _Initial;
  const factory StoreState.storeCreated({
    @required Store store,
  }) = _StoreCreated;
}
