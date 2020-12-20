import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/store/store.dart';

part 'store_status_state.freezed.dart';

@freezed
abstract class StoreStatusState with _$StoreStatusState {
  const factory StoreStatusState.present({
    @required Store store,
  }) = _PresentStore;
  const factory StoreStatusState.absent() = _AbsentStore;
}
