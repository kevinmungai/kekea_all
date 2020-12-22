// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrinkage_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShrinkageType _$_$_ShrinkageTypeFromJson(Map json) {
  return _$_ShrinkageType(
    id: json['shrinkage_type__id'] as String,
    text: json['shrinkage_type__text'] as String,
    description: json['shrinkage_type__description'] as String,
  );
}

Map<String, dynamic> _$_$_ShrinkageTypeToJson(_$_ShrinkageType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shrinkage_type__id', instance.id);
  writeNotNull('shrinkage_type__text', instance.text);
  writeNotNull('shrinkage_type__description', instance.description);
  return val;
}
