import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business_person/business_person.dart';

part 'business_person_state.freezed.dart';

@freezed
abstract class BusinessPersonState with _$BusinessPersonState {
  const factory BusinessPersonState.initial() = _Initial;
  const factory BusinessPersonState.createSuccess({
    @required BusinessPerson businessPerson,
  }) = _CreateSuccess;
  const factory BusinessPersonState.updateSuccess({
    @required BusinessPerson businessPerson,
  }) = _UpdateSuccess;
}
