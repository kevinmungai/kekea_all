import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/sale_product/sale_product.dart';

part 'product_list_status_state.freezed.dart';

@freezed
abstract class ProductListStatusState with _$ProductListStatusState {
  const factory ProductListStatusState.loading() = _Loading;
  const factory ProductListStatusState.present({
    @required BuiltList<SaleProduct> saleProducts,
    @required BuiltList<SaleProduct> selectedProducts,
    @required bool showSelected,
  }) = _Present;
}
