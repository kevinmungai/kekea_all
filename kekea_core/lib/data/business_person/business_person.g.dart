// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessPerson _$_$_BusinessPersonFromJson(Map<String, dynamic> json) {
  return _$_BusinessPerson(
    firebaseId: json['business_person__firebase_id'] as String,
    email: json['business_person__email'] as String,
    name: json['business_person__name'] as String,
    phone: json['business_person__phone'] as String,
    defaultBusiness: json['business_person__default_business'] as String,
    defaultStore: json['business_person__default_store'] as String,
  );
}

Map<String, dynamic> _$_$_BusinessPersonToJson(_$_BusinessPerson instance) =>
    <String, dynamic>{
      'business_person__firebase_id': instance.firebaseId,
      'business_person__email': instance.email,
      'business_person__name': instance.name,
      'business_person__phone': instance.phone,
      'business_person__default_business': instance.defaultBusiness,
      'business_person__default_store': instance.defaultStore,
    };
