// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_reservation_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreReservationProduct _$_$_StoreReservationProductFromJson(
    Map<String, dynamic> json) {
  return _$_StoreReservationProduct(
    id: json['store_reservation_product__id'] as String,
    name: json['store_reservation_product__name'] as String,
    quantity: json['store_reservation_product__quantity'] as int,
    refId: json['store_product_reservation__ref_id'] as String,
  );
}

Map<String, dynamic> _$_$_StoreReservationProductToJson(
        _$_StoreReservationProduct instance) =>
    <String, dynamic>{
      'store_reservation_product__id': instance.id,
      'store_reservation_product__name': instance.name,
      'store_reservation_product__quantity': instance.quantity,
      'store_product_reservation__ref_id': instance.refId,
    };
