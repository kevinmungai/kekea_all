import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business_person/business_person.dart';

part 'business_person_event.freezed.dart';

@freezed
abstract class BusinessPersonEvent with _$BusinessPersonEvent {
  const factory BusinessPersonEvent.createBusinessPerson({
    @required BusinessPerson businessPerson,
  }) = _CreateBusinessPerson;
  const factory BusinessPersonEvent.updateBusinessPerson({
    @required BusinessPerson businessPerson,
  }) = _UpdateBusinessPerson;
}
