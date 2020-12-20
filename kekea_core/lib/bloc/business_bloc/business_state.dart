import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business/business.dart';

part 'business_state.freezed.dart';

@freezed
abstract class BusinessState with _$BusinessState {
  const factory BusinessState.initial() = _Initial;
  const factory BusinessState.businessCreated({
    @required Business business,
  }) = _BusinessCreated;
  const factory BusinessState.businessUpdated({
    @required Business business,
  }) = _BusinessUpdated;
}
