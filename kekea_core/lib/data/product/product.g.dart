// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    id: json['product__id'] as String,
    name: json['product__name'] as String,
    description: json['product__description'] as String,
    photo: const StringBuiltListConverter()
        .fromJson(json['product__photo'] as List),
    price: json['product__price'] == null
        ? null
        : Price.fromJson(json['product__price'] as Map<String, dynamic>),
    quantity: json['product__quantity'] as int,
    tax: const TaxBuiltListConverter().fromJson(json['product__tax'] as List),
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'product__id': instance.id,
      'product__name': instance.name,
      'product__description': instance.description,
      'product__photo': const StringBuiltListConverter().toJson(instance.photo),
      'product__price': instance.price,
      'product__quantity': instance.quantity,
      'product__tax': const TaxBuiltListConverter().toJson(instance.tax),
    };
