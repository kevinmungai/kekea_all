// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Discount _$_$_DiscountFromJson(Map<String, dynamic> json) {
  return _$_Discount(
    price: json['price'] == null
        ? null
        : Price.fromJson(json['price'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DiscountToJson(_$_Discount instance) =>
    <String, dynamic>{
      'price': instance.price,
    };
