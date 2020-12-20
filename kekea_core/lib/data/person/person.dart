import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
abstract class Person with _$Person {
  const factory Person({
    @required @JsonKey(name: c.personPhone) String phone,
    @JsonKey(name: c.personName) String name,
    @JsonKey(name: c.personEmail) String email,
    @required @JsonKey(name: c.personId) String id,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
