// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrinkage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shrinkage _$_$_ShrinkageFromJson(Map json) {
  return _$_Shrinkage(
    id: json['shrinkage__id'] as String,
    reportingTime: const TimestampConverter()
        .fromJson(json['shrinkage__reporting_time'] as Timestamp),
    occurrenceTime: const TimestampConverter()
        .fromJson(json['shrinkage__occurrence_time'] as Timestamp),
    reporter: json['shrinkage__reporter'] == null
        ? null
        : BusinessMember.fromJson((json['shrinkage__reporter'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    shrinkageTypes: (json['shrinkage__shrinkage_types'] as List)
        ?.map((e) => e == null
            ? null
            : ShrinkageType.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    description: json['shrinkage__description'] as String,
    shrinkageProducts: (json['shrinkage__products'] as List)
        ?.map((e) => e == null
            ? null
            : ShrinkageProduct.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ShrinkageToJson(_$_Shrinkage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shrinkage__id', instance.id);
  writeNotNull('shrinkage__reporting_time',
      const TimestampConverter().toJson(instance.reportingTime));
  writeNotNull('shrinkage__occurrence_time',
      const TimestampConverter().toJson(instance.occurrenceTime));
  writeNotNull('shrinkage__reporter', instance.reporter?.toJson());
  writeNotNull('shrinkage__shrinkage_types',
      instance.shrinkageTypes?.map((e) => e?.toJson())?.toList());
  writeNotNull('shrinkage__description', instance.description);
  writeNotNull('shrinkage__products',
      instance.shrinkageProducts?.map((e) => e?.toJson())?.toList());
  return val;
}
