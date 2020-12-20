import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'store_reservation_product.freezed.dart';
part 'store_reservation_product.g.dart';

/// a product that has been reserved
@freezed
abstract class StoreReservationProduct with _$StoreReservationProduct {
  const factory StoreReservationProduct({
    @JsonKey(name: c.storeReservationProductId) String id,
    @required @JsonKey(name: c.storeReservationProductName) String name,
    @required @JsonKey(name: c.storeReservationProductQuantity) int quantity,
    @required @JsonKey(name: c.storeReservationProductRefId) String refId,
  }) = _StoreReservationProduct;

  factory StoreReservationProduct.fromJson(Map<String, dynamic> json) =>
      _$StoreReservationProductFromJson(json);
}
