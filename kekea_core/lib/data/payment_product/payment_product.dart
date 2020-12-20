import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../discount/discount.dart';
import '../price/price.dart';
import '../tax/tax.dart';
import '../../utils/constants.dart' as c;
import '../../converters/tax_built_list_converter.dart';

part 'payment_product.freezed.dart';
part 'payment_product.g.dart';

/// represents the products that have been bought
@freezed
abstract class PaymentProduct with _$PaymentProduct {
  const factory PaymentProduct({
    @JsonKey(name: c.paymentProductId) String id,
    @required @JsonKey(name: c.paymentProductName) String name,
    @required @JsonKey(name: c.paymentProductPrice) Price price,
    @TaxBuiltListConverter()
    @JsonKey(name: c.paymentProductTax)
        BuiltList<Tax> taxes,
    @required @JsonKey(name: c.paymentProductQuantity) int quantity,
    @required @JsonKey(name: c.paymentProductRefId) String refId,
    @JsonKey(name: c.paymentProductDiscount) Discount discount,
  }) = _PaymentProduct;

  factory PaymentProduct.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductFromJson(json);
}
