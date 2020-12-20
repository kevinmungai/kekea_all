import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../store/store.dart';

part 'store_result.freezed.dart';

@freezed
abstract class StoreResult with _$StoreResult {
  const factory StoreResult.present({
    @required Store store,
  }) = _Present;
  const factory StoreResult.absent() = _Absent;
}
