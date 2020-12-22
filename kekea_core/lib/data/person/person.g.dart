// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$_$_PersonFromJson(Map json) {
  return _$_Person(
    phone: json['person__phone'] as String,
    name: json['person__name'] as String,
    email: json['person__email'] as String,
    id: json['person__id'] as String,
  );
}

Map<String, dynamic> _$_$_PersonToJson(_$_Person instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('person__phone', instance.phone);
  writeNotNull('person__name', instance.name);
  writeNotNull('person__email', instance.email);
  writeNotNull('person__id', instance.id);
  return val;
}
