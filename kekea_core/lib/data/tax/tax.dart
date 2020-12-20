import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'tax.freezed.dart';
part 'tax.g.dart';

@freezed
abstract class Tax with _$Tax {
  const factory Tax({
    @required @JsonKey(name: c.taxName) String name,
    @required @JsonKey(name: c.taxPercentage) BigInt percentage,
    @required @JsonKey(name: c.taxDisplayText) String displayText,
    @required @JsonKey(name: c.taxDescription) String description,
    @required @JsonKey(name: c.taxId) String id,
  }) = _Tax;

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);
}
