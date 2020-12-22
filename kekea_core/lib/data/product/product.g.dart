// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map json) {
  return _$_Product(
    id: json['product__id'] as String,
    name: json['product__name'] as String,
    description: json['product__description'] as String,
    photo: const StringBuiltListConverter()
        .fromJson(json['product__photo'] as List),
    price: json['product__price'] == null
        ? null
        : Price.fromJson((json['product__price'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    quantity: json['product__quantity'] as int,
    tax: const TaxBuiltListConverter().fromJson(json['product__tax'] as List),
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product__id', instance.id);
  writeNotNull('product__name', instance.name);
  writeNotNull('product__description', instance.description);
  writeNotNull('product__photo',
      const StringBuiltListConverter().toJson(instance.photo));
  writeNotNull('product__price', instance.price?.toJson());
  writeNotNull('product__quantity', instance.quantity);
  writeNotNull(
      'product__tax', const TaxBuiltListConverter().toJson(instance.tax));
  return val;
}
