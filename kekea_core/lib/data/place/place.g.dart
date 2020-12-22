// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Place _$_$_PlaceFromJson(Map json) {
  return _$_Place(
    geoPoint:
        const GeoPointConverter().fromJson(json['place__geopoint'] as GeoPoint),
    description: json['place__description'] as String,
    streetName: json['place__street_name'] as String,
    directions: json['place__directions'] as String,
    extraInfo: json['place__extra_info'] as String,
    propertyName: json['place__property_name'] as String,
  );
}

Map<String, dynamic> _$_$_PlaceToJson(_$_Place instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'place__geopoint', const GeoPointConverter().toJson(instance.geoPoint));
  writeNotNull('place__description', instance.description);
  writeNotNull('place__street_name', instance.streetName);
  writeNotNull('place__directions', instance.directions);
  writeNotNull('place__extra_info', instance.extraInfo);
  writeNotNull('place__property_name', instance.propertyName);
  return val;
}
