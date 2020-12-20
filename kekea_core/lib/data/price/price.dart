import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../currency/currency.dart';

part 'price.freezed.dart';
part 'price.g.dart';

/**
 * NOTE: amount is in **cents**.
 */
@freezed
abstract class Price with _$Price {
  const factory Price({
    /// amount is in **cents**.
    @JsonKey(name: "price__amount") BigInt amount,
    @JsonKey(name: "price__currency") Currency currency,
  }) = _Price;

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}
