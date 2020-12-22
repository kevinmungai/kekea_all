// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$_$_PriceFromJson(Map json) {
  return _$_Price(
    amount: json['price__amount'] == null
        ? null
        : BigInt.parse(json['price__amount'] as String),
    currency: json['price__currency'] == null
        ? null
        : Currency.fromJson((json['price__currency'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$_$_PriceToJson(_$_Price instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('price__amount', instance.amount?.toString());
  writeNotNull('price__currency', instance.currency?.toJson());
  return val;
}
