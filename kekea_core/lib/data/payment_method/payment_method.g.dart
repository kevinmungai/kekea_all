// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cash _$_$_CashFromJson(Map<String, dynamic> json) {
  return _$_Cash(
    amountGiven: json['amount_given'] == null
        ? null
        : BigInt.parse(json['amount_given'] as String),
    total: json['total'] == null ? null : BigInt.parse(json['total'] as String),
    change:
        json['change'] == null ? null : BigInt.parse(json['change'] as String),
  );
}

Map<String, dynamic> _$_$_CashToJson(_$_Cash instance) => <String, dynamic>{
      'amount_given': instance.amountGiven?.toString(),
      'total': instance.total?.toString(),
      'change': instance.change?.toString(),
    };

_$_Mpesa _$_$_MpesaFromJson(Map<String, dynamic> json) {
  return _$_Mpesa(
    refNumber: json['ref_number'] as String,
  );
}

Map<String, dynamic> _$_$_MpesaToJson(_$_Mpesa instance) => <String, dynamic>{
      'ref_number': instance.refNumber,
    };

_$_Card _$_$_CardFromJson(Map<String, dynamic> json) {
  return _$_Card(
    refNumber: json['ref_number'] as String,
  );
}

Map<String, dynamic> _$_$_CardToJson(_$_Card instance) => <String, dynamic>{
      'ref_number': instance.refNumber,
    };

_$_Credit _$_$_CreditFromJson(Map<String, dynamic> json) {
  return _$_Credit(
    customerPhone: json['customer_phone'] as String,
  );
}

Map<String, dynamic> _$_$_CreditToJson(_$_Credit instance) => <String, dynamic>{
      'customer_phone': instance.customerPhone,
    };
