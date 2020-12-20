import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/edit_product/edit_product.dart';

part 'edit_product_state.freezed.dart';

@freezed
abstract class EditProductState with _$EditProductState {
  const factory EditProductState.present({
    @required EditProduct editProduct,
  }) = _Present;
  const factory EditProductState.absent() = _Absent;
}
