import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../price/price.dart';
import '../tax/tax.dart';
import '../../utils/constants.dart' as c;
import '../../converters/string_built_list_converter.dart';
import '../../converters/tax_built_list_converter.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    @JsonKey(name: c.productId) String id,
    @JsonKey(name: c.productName) String name,
    @JsonKey(name: c.productDescription) String description,
    @StringBuiltListConverter()
    @JsonKey(name: c.productPhoto)
        BuiltList<String> photo,
    @JsonKey(name: c.productPrice) Price price,
    @JsonKey(name: c.productQuantity) int quantity,
    @TaxBuiltListConverter() @JsonKey(name: c.productTax) BuiltList<Tax> tax,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
