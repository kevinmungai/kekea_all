// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tax _$_$_TaxFromJson(Map json) {
  return _$_Tax(
    name: json['tax__name'] as String,
    percentage: json['tax__percentage'] == null
        ? null
        : BigInt.parse(json['tax__percentage'] as String),
    displayText: json['tax__display_text'] as String,
    description: json['tax__description'] as String,
    id: json['tax__id'] as String,
  );
}

Map<String, dynamic> _$_$_TaxToJson(_$_Tax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tax__name', instance.name);
  writeNotNull('tax__percentage', instance.percentage?.toString());
  writeNotNull('tax__display_text', instance.displayText);
  writeNotNull('tax__description', instance.description);
  writeNotNull('tax__id', instance.id);
  return val;
}
