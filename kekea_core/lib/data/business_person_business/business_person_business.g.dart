// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_person_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessPersonBusiness _$_$_BusinessPersonBusinessFromJson(Map json) {
  return _$_BusinessPersonBusiness(
    id: json['business_person_businesses__id'] as String,
    name: json['business_person_businesses__name'] as String,
    def: json['business_person_businesses__default'] as String,
  );
}

Map<String, dynamic> _$_$_BusinessPersonBusinessToJson(
    _$_BusinessPersonBusiness instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('business_person_businesses__id', instance.id);
  writeNotNull('business_person_businesses__name', instance.name);
  writeNotNull('business_person_businesses__default', instance.def);
  return val;
}
