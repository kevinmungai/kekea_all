import '../place/place.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'store.freezed.dart';
part 'store.g.dart';

/// TODO: STORE SHOULD BE LOCATION
@freezed
abstract class Store with _$Store {
  const factory Store({
    @JsonKey(name: c.storeName) String name,
    @JsonKey(name: c.storePlace) Place place,

    /// TODO: RELAX THE NEED FOR AN ID
    @JsonKey(name: c.storeId) String id,
  }) = _Store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
