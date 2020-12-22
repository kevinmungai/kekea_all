// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cash _$_$_CashFromJson(Map json) {
  return _$_Cash(
    amountGiven: json['amount_given'] == null
        ? null
        : BigInt.parse(json['amount_given'] as String),
    total: json['total'] == null ? null : BigInt.parse(json['total'] as String),
    change:
        json['change'] == null ? null : BigInt.parse(json['change'] as String),
  );
}

Map<String, dynamic> _$_$_CashToJson(_$_Cash instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount_given', instance.amountGiven?.toString());
  writeNotNull('total', instance.total?.toString());
  writeNotNull('change', instance.change?.toString());
  return val;
}

_$_Mpesa _$_$_MpesaFromJson(Map json) {
  return _$_Mpesa(
    refNumber: json['ref_number'] as String,
  );
}

Map<String, dynamic> _$_$_MpesaToJson(_$_Mpesa instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ref_number', instance.refNumber);
  return val;
}

_$_Card _$_$_CardFromJson(Map json) {
  return _$_Card(
    refNumber: json['ref_number'] as String,
  );
}

Map<String, dynamic> _$_$_CardToJson(_$_Card instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ref_number', instance.refNumber);
  return val;
}

_$_Credit _$_$_CreditFromJson(Map json) {
  return _$_Credit(
    customerPhone: json['customer_phone'] as String,
  );
}

Map<String, dynamic> _$_$_CreditToJson(_$_Credit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer_phone', instance.customerPhone);
  return val;
}
