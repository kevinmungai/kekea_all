import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'create_product_event.freezed.dart';

@freezed
abstract class CreateProductEvent with _$CreateProductEvent {
  const factory CreateProductEvent.changeName({
    @required String name,
  }) = _ChangeName;
  const factory CreateProductEvent.changePriceAmount({
    @required BigInt amount,
  }) = _ChangePriceAmount;
  const factory CreateProductEvent.changeQuantity({
    @required int quantity,
  }) = _ChangeQuantity;
  const factory CreateProductEvent.createProduct() = _CreateProduct;
}
