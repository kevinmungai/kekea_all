import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../business_person/business_person.dart';

part 'business_person_result.freezed.dart';

@freezed
abstract class BusinessPersonResult with _$BusinessPersonResult {
  const factory BusinessPersonResult.present(
    BusinessPerson businessPerson,
  ) = _Present;
  const factory BusinessPersonResult.absent({
    @required String firebaseId,
  }) = _Absent;
}
