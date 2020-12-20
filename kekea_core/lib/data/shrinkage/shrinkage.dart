import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../business_member/business_member.dart';
import '../shrinkage_product/shrinkage_product.dart';
import '../shrinkage_type/shrinkage_type.dart';
import '../../converters/timestamp_converter.dart';
import '../../utils/constants.dart' as c;

part 'shrinkage.freezed.dart';
part 'shrinkage.g.dart';

@freezed
abstract class Shrinkage with _$Shrinkage {
  const factory Shrinkage({
    @JsonKey(name: c.shrinkageId) String id,
    @required
    @JsonKey(name: c.shrinkageReportingTime)
    @TimestampConverter()
        Timestamp reportingTime,
    @required
    @JsonKey(name: c.shrinkageOccurrenceTime)
    @TimestampConverter()
        Timestamp occurrenceTime,
    @required @JsonKey(name: c.shrinkageReporter) BusinessMember reporter,
    @JsonKey(name: c.shrinkageShrinkageTypes)
        List<ShrinkageType> shrinkageTypes,
    @JsonKey(name: c.shrinkageDescription) String description,
    @JsonKey(name: c.shrinkageProducts)
        List<ShrinkageProduct> shrinkageProducts,
  }) = _Shrinkage;

  factory Shrinkage.fromJson(Map<String, dynamic> json) =>
      _$ShrinkageFromJson(json);
}
