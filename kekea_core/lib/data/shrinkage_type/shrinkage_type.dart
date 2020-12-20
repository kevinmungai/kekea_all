import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'shrinkage_type.freezed.dart';
part 'shrinkage_type.g.dart';

@freezed
abstract class ShrinkageType with _$ShrinkageType {
  const factory ShrinkageType({
    @required @JsonKey(name: c.shrinkageTypeId) String id,
    @required @JsonKey(name: c.shrinkageTypeText) String text,
    @required @JsonKey(name: c.shrinkageTypeDescription) String description,
  }) = _ShrinkageType;

  factory ShrinkageType.fromJson(Map<String, dynamic> json) =>
      _$ShrinkageTypeFromJson(json);
}
