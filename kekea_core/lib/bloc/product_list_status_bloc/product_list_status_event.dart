import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/product/product.dart';
import '../../data/sale_product/sale_product.dart';

part 'product_list_status_event.freezed.dart';

@freezed
abstract class ProductListStatusEvent with _$ProductListStatusEvent {
  const factory ProductListStatusEvent.listen({
    @required String businessId,
    @required String storeId,
  }) = _Listen;
  const factory ProductListStatusEvent.stopListening() = _StopListening;
  const factory ProductListStatusEvent.setPresent({
    @required BuiltList<Product> products,
  }) = _SetPresent;
  const factory ProductListStatusEvent.cancel() = _Cancel;
  const factory ProductListStatusEvent.toggleSelected() = _ToggleSelected;
  const factory ProductListStatusEvent.addSaleQuantity({
    @required SaleProduct saleProduct,
  }) = _AddSaleQuantity;
  const factory ProductListStatusEvent.minusSaleQuantity({
    @required SaleProduct saleProduct,
  }) = _MinusSaleQuantity;
  const factory ProductListStatusEvent.selectAllSaleProduct({
    @required SaleProduct saleProduct,
  }) = _SelectAllSaleProduct;
  const factory ProductListStatusEvent.changeDiscount({
    @required String productId,
    @required BigInt amount,
  }) = _ChangeDiscount;
  const factory ProductListStatusEvent.cancelDiscount({
    @required String productId,
  }) = _CancelDiscount;
}
