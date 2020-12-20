import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'business_person.freezed.dart';
part 'business_person.g.dart';

@freezed
abstract class BusinessPerson with _$BusinessPerson {
  const factory BusinessPerson({
    @required @JsonKey(name: c.businessPersonFirebaseId) String firebaseId,
    @JsonKey(name: c.businessPersonEmail) String email,
    @JsonKey(name: c.businessPersonName) String name,
    @JsonKey(name: c.businessPersonPhone) String phone,
    @JsonKey(name: c.businessPersonDefaultBusiness) String defaultBusiness,
    @JsonKey(name: c.businessPersonDefaultStore) String defaultStore,
  }) = _BusinessPerson;

  factory BusinessPerson.fromJson(Map<String, dynamic> json) =>
      _$BusinessPersonFromJson(json);
}
