import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../discount/discount.dart';
import '../product/product.dart';

part 'sale_product.freezed.dart';

/// This represents a sold product and
/// It contains the product and the quantity.
@freezed
abstract class SaleProduct with _$SaleProduct {
  const factory SaleProduct({
    @required Product product,
    @required int quantity,
    Discount discount,
  }) = _SaleProduct;
}
