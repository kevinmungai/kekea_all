// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Customer _$_$_CustomerFromJson(Map json) {
  return _$_Customer(
    phone: json['customer_phone'] as String,
  );
}

Map<String, dynamic> _$_$_CustomerToJson(_$_Customer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customer_phone', instance.phone);
  return val;
}
