import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dynamic_link_state.freezed.dart';

@freezed
abstract class DynamicLinkState with _$DynamicLinkState {
  const factory DynamicLinkState.present({
    @required Uri uri,
  }) = _Present;
  const factory DynamicLinkState.absent() = _Absent;
}
