// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Person _$_$_PersonFromJson(Map<String, dynamic> json) {
  return _$_Person(
    phone: json['person__phone'] as String,
    name: json['person__name'] as String,
    email: json['person__email'] as String,
    id: json['person__id'] as String,
  );
}

Map<String, dynamic> _$_$_PersonToJson(_$_Person instance) => <String, dynamic>{
      'person__phone': instance.phone,
      'person__name': instance.name,
      'person__email': instance.email,
      'person__id': instance.id,
    };
