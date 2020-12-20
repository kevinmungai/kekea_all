import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../converters/geopoint_converter.dart';
import '../../utils/constants.dart' as c;

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
abstract class Place with _$Place {
  const factory Place({
    @required
    @JsonKey(name: c.placeGeoPoint)
    @GeoPointConverter()
        GeoPoint geoPoint,
    @JsonKey(name: c.placeDescription) String description,
    @JsonKey(name: c.placeStreetName) String streetName,
    @JsonKey(name: c.placeDirections) String directions,
    @JsonKey(name: c.placeExtraInfo) String extraInfo,
    @JsonKey(name: c.placePropertyName) String propertyName,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
