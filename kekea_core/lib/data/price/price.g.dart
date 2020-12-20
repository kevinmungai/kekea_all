// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Price _$_$_PriceFromJson(Map<String, dynamic> json) {
  return _$_Price(
    amount: json['price__amount'] == null
        ? null
        : BigInt.parse(json['price__amount'] as String),
    currency: json['price__currency'] == null
        ? null
        : Currency.fromJson(json['price__currency'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PriceToJson(_$_Price instance) => <String, dynamic>{
      'price__amount': instance.amount?.toString(),
      'price__currency': instance.currency,
    };
