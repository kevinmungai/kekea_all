// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentProduct _$_$_PaymentProductFromJson(Map<String, dynamic> json) {
  return _$_PaymentProduct(
    id: json['payment_product__id'] as String,
    name: json['payment_product__name'] as String,
    price: json['payment_product__price'] == null
        ? null
        : Price.fromJson(
            json['payment_product__price'] as Map<String, dynamic>),
    taxes: const TaxBuiltListConverter()
        .fromJson(json['payment_product__tax'] as List),
    quantity: json['payment_product__quantity'] as int,
    refId: json['payment_product__ref_id'] as String,
    discount: json['payment_product__discount'] == null
        ? null
        : Discount.fromJson(
            json['payment_product__discount'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PaymentProductToJson(_$_PaymentProduct instance) =>
    <String, dynamic>{
      'payment_product__id': instance.id,
      'payment_product__name': instance.name,
      'payment_product__price': instance.price,
      'payment_product__tax':
          const TaxBuiltListConverter().toJson(instance.taxes),
      'payment_product__quantity': instance.quantity,
      'payment_product__ref_id': instance.refId,
      'payment_product__discount': instance.discount,
    };
