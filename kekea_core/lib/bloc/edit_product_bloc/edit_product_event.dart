import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/product/product.dart';

part 'edit_product_event.freezed.dart';

@freezed
abstract class EditProductEvent with _$EditProductEvent {
  const factory EditProductEvent.reset() = _Reset;
  const factory EditProductEvent.submit() = _Submit;
  const factory EditProductEvent.changeName({
    @required String name,
  }) = _ChangeName;
  const factory EditProductEvent.changeQuantity({
    @required int quantity,
  }) = _ChangeQuantity;
  const factory EditProductEvent.changePriceAmount({
    @required BigInt amount,
  }) = _ChangePriceAmount;
  const factory EditProductEvent.loadProduct({
    @required Product product,
  }) = _LoadProduct;
  const factory EditProductEvent.setAbsent() = _SetAbsent;
}
