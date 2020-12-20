import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'shrinkage_product.freezed.dart';
part 'shrinkage_product.g.dart';

/// represents products that have undergone shrinkage
@freezed
abstract class ShrinkageProduct with _$ShrinkageProduct {
  const factory ShrinkageProduct({
    @JsonKey(name: c.shrinkageProductId) String id,
    @required @JsonKey(name: c.shrinkageProductName) String name,
    @required @JsonKey(name: c.shrinkageProductQuantity) int quantity,
    @required @JsonKey(name: c.shrinkageProductRefId) String refId,
  }) = _ShrinkageProduct;

  factory ShrinkageProduct.fromJson(Map<String, dynamic> json) =>
      _$ShrinkageProductFromJson(json);
}
