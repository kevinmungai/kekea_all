// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Currency _$_$_CurrencyFromJson(Map json) {
  return _$_Currency(
    id: json['currency__id'] as String,
    text: json['currency__text'] as String,
  );
}

Map<String, dynamic> _$_$_CurrencyToJson(_$_Currency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currency__id', instance.id);
  writeNotNull('currency__text', instance.text);
  return val;
}
