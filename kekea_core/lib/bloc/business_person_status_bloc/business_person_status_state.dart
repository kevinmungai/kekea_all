import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business_person/business_person.dart';

part 'business_person_status_state.freezed.dart';

@freezed
abstract class BusinessPersonStatusState with _$BusinessPersonStatusState {
  const factory BusinessPersonStatusState.present({
    @required BusinessPerson businessPerson,
  }) = _Present;
  const factory BusinessPersonStatusState.absent() = _Absent;
}
