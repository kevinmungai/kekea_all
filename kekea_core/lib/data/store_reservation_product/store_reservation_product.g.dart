// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_reservation_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreReservationProduct _$_$_StoreReservationProductFromJson(Map json) {
  return _$_StoreReservationProduct(
    id: json['store_reservation_product__id'] as String,
    name: json['store_reservation_product__name'] as String,
    quantity: json['store_reservation_product__quantity'] as int,
    refId: json['store_product_reservation__ref_id'] as String,
  );
}

Map<String, dynamic> _$_$_StoreReservationProductToJson(
    _$_StoreReservationProduct instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('store_reservation_product__id', instance.id);
  writeNotNull('store_reservation_product__name', instance.name);
  writeNotNull('store_reservation_product__quantity', instance.quantity);
  writeNotNull('store_product_reservation__ref_id', instance.refId);
  return val;
}
