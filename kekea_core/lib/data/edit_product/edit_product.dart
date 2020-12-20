import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../product/product.dart';

part 'edit_product.freezed.dart';

@freezed
abstract class EditProduct with _$EditProduct {
  const factory EditProduct({
    @required Product original,
    @required Product editable,
  }) = _EditProduct;
}
