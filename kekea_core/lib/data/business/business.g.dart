// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Business _$_$_BusinessFromJson(Map json) {
  return _$_Business(
    name: json['business__name'] as String,
    id: json['business__id'] as String,
  );
}

Map<String, dynamic> _$_$_BusinessToJson(_$_Business instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('business__name', instance.name);
  writeNotNull('business__id', instance.id);
  return val;
}
