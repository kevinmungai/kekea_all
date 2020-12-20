import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/product/product.dart';

part 'create_product_state.freezed.dart';

@freezed
abstract class CreateProductState with _$CreateProductState {
  const factory CreateProductState.currentProduct({
    @required Product product,
  }) = _CurrentProduct;
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.created({
    @required Product product,
  }) = _Created;
  const factory CreateProductState.cannotCreateProduct() = _CannotCreateProduct;
}
