// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_person_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessPersonBusiness _$_$_BusinessPersonBusinessFromJson(
    Map<String, dynamic> json) {
  return _$_BusinessPersonBusiness(
    id: json['business_person_businesses__id'] as String,
    name: json['business_person_businesses__name'] as String,
    def: json['business_person_businesses__default'] as String,
  );
}

Map<String, dynamic> _$_$_BusinessPersonBusinessToJson(
        _$_BusinessPersonBusiness instance) =>
    <String, dynamic>{
      'business_person_businesses__id': instance.id,
      'business_person_businesses__name': instance.name,
      'business_person_businesses__default': instance.def,
    };
