// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$_$_PaymentFromJson(Map json) {
  return _$_Payment(
    id: json['payment__id'] as String,
    customer: json['payment__customer'] == null
        ? null
        : Customer.fromJson((json['payment__customer'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    cashier: json['payment__cashier'] == null
        ? null
        : BusinessPerson.fromJson((json['payment__cashier'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    price: json['payment__price'] == null
        ? null
        : Price.fromJson((json['payment__price'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    paymentMethod: json['payment__payment_method'] == null
        ? null
        : PaymentMethod.fromJson((json['payment__payment_method'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    timestamp: const TimestampConverter()
        .fromJson(json['payment__timestamp'] as Timestamp),
    business: json['payment__business'] == null
        ? null
        : Business.fromJson((json['payment__business'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    store: json['payment__store'] == null
        ? null
        : Store.fromJson((json['payment__store'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    uri: json['payment__uri'] == null
        ? null
        : Uri.parse(json['payment__uri'] as String),
    shortUri: json['payment__short_uri'] == null
        ? null
        : Uri.parse(json['payment__short_uri'] as String),
  );
}

Map<String, dynamic> _$_$_PaymentToJson(_$_Payment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payment__id', instance.id);
  writeNotNull('payment__customer', instance.customer?.toJson());
  writeNotNull('payment__cashier', instance.cashier?.toJson());
  writeNotNull('payment__price', instance.price?.toJson());
  writeNotNull('payment__payment_method', instance.paymentMethod?.toJson());
  writeNotNull('payment__timestamp',
      const TimestampConverter().toJson(instance.timestamp));
  writeNotNull('payment__business', instance.business?.toJson());
  writeNotNull('payment__store', instance.store?.toJson());
  writeNotNull('payment__uri', instance.uri?.toString());
  writeNotNull('payment__short_uri', instance.shortUri?.toString());
  return val;
}
