// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentProduct _$_$_PaymentProductFromJson(Map json) {
  return _$_PaymentProduct(
    id: json['payment_product__id'] as String,
    name: json['payment_product__name'] as String,
    price: json['payment_product__price'] == null
        ? null
        : Price.fromJson((json['payment_product__price'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    taxes: const TaxBuiltListConverter()
        .fromJson(json['payment_product__tax'] as List),
    quantity: json['payment_product__quantity'] as int,
    refId: json['payment_product__ref_id'] as String,
    discount: json['payment_product__discount'] == null
        ? null
        : Discount.fromJson((json['payment_product__discount'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$_$_PaymentProductToJson(_$_PaymentProduct instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment_product__id', instance.id);
  writeNotNull('payment_product__name', instance.name);
  writeNotNull('payment_product__price', instance.price?.toJson());
  writeNotNull('payment_product__tax',
      const TaxBuiltListConverter().toJson(instance.taxes));
  writeNotNull('payment_product__quantity', instance.quantity);
  writeNotNull('payment_product__ref_id', instance.refId);
  writeNotNull('payment_product__discount', instance.discount?.toJson());
  return val;
}
