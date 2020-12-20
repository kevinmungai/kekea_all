// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrinkage_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShrinkageProduct _$_$_ShrinkageProductFromJson(Map<String, dynamic> json) {
  return _$_ShrinkageProduct(
    id: json['shrinkage_product__id'] as String,
    name: json['shrinkage_product__name'] as String,
    quantity: json['shrinkage_product__quantity'] as int,
    refId: json['shrinkage_product__ref_id'] as String,
  );
}

Map<String, dynamic> _$_$_ShrinkageProductToJson(
        _$_ShrinkageProduct instance) =>
    <String, dynamic>{
      'shrinkage_product__id': instance.id,
      'shrinkage_product__name': instance.name,
      'shrinkage_product__quantity': instance.quantity,
      'shrinkage_product__ref_id': instance.refId,
    };
