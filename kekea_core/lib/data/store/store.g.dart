// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map json) {
  return _$_Store(
    name: json['store__name'] as String,
    place: json['store__place'] == null
        ? null
        : Place.fromJson((json['store__place'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    id: json['store__id'] as String,
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('store__name', instance.name);
  writeNotNull('store__place', instance.place?.toJson());
  writeNotNull('store__id', instance.id);
  return val;
}
