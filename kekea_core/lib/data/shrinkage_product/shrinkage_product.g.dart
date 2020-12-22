// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrinkage_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShrinkageProduct _$_$_ShrinkageProductFromJson(Map json) {
  return _$_ShrinkageProduct(
    id: json['shrinkage_product__id'] as String,
    name: json['shrinkage_product__name'] as String,
    quantity: json['shrinkage_product__quantity'] as int,
    refId: json['shrinkage_product__ref_id'] as String,
  );
}

Map<String, dynamic> _$_$_ShrinkageProductToJson(_$_ShrinkageProduct instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shrinkage_product__id', instance.id);
  writeNotNull('shrinkage_product__name', instance.name);
  writeNotNull('shrinkage_product__quantity', instance.quantity);
  writeNotNull('shrinkage_product__ref_id', instance.refId);
  return val;
}
