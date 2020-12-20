import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../price/price.dart';

part 'discount.freezed.dart';
part 'discount.g.dart';

@freezed
abstract class Discount with _$Discount {
  const factory Discount({
    @required Price price,
  }) = _Discount;

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);
}
