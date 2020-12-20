// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shrinkage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Shrinkage _$_$_ShrinkageFromJson(Map<String, dynamic> json) {
  return _$_Shrinkage(
    id: json['shrinkage__id'] as String,
    reportingTime: const TimestampConverter()
        .fromJson(json['shrinkage__reporting_time'] as Timestamp),
    occurrenceTime: const TimestampConverter()
        .fromJson(json['shrinkage__occurrence_time'] as Timestamp),
    reporter: json['shrinkage__reporter'] == null
        ? null
        : BusinessMember.fromJson(
            json['shrinkage__reporter'] as Map<String, dynamic>),
    shrinkageTypes: (json['shrinkage__shrinkage_types'] as List)
        ?.map((e) => e == null
            ? null
            : ShrinkageType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['shrinkage__description'] as String,
    shrinkageProducts: (json['shrinkage__products'] as List)
        ?.map((e) => e == null
            ? null
            : ShrinkageProduct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ShrinkageToJson(_$_Shrinkage instance) =>
    <String, dynamic>{
      'shrinkage__id': instance.id,
      'shrinkage__reporting_time':
          const TimestampConverter().toJson(instance.reportingTime),
      'shrinkage__occurrence_time':
          const TimestampConverter().toJson(instance.occurrenceTime),
      'shrinkage__reporter': instance.reporter,
      'shrinkage__shrinkage_types': instance.shrinkageTypes,
      'shrinkage__description': instance.description,
      'shrinkage__products': instance.shrinkageProducts,
    };
