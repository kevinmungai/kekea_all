// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    name: json['store__name'] as String,
    place: json['store__place'] == null
        ? null
        : Place.fromJson(json['store__place'] as Map<String, dynamic>),
    id: json['store__id'] as String,
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'store__name': instance.name,
      'store__place': instance.place,
      'store__id': instance.id,
    };
