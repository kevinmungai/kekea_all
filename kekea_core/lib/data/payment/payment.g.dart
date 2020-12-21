// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Payment _$_$_PaymentFromJson(Map<String, dynamic> json) {
  return _$_Payment(
    id: json['payment__id'] as String,
    customer: json['payment__customer'] == null
        ? null
        : Customer.fromJson(json['payment__customer'] as Map<String, dynamic>),
    cashier: json['payment__cashier'] == null
        ? null
        : BusinessPerson.fromJson(
            json['payment__cashier'] as Map<String, dynamic>),
    price: json['payment__price'] == null
        ? null
        : Price.fromJson(json['payment__price'] as Map<String, dynamic>),
    paymentMethod: json['payment__payment_method'] == null
        ? null
        : PaymentMethod.fromJson(
            json['payment__payment_method'] as Map<String, dynamic>),
    timestamp: const TimestampConverter()
        .fromJson(json['payment__timestamp'] as Timestamp),
    business: json['payment__business'] == null
        ? null
        : Business.fromJson(json['payment__business'] as Map<String, dynamic>),
    store: json['payment__store'] == null
        ? null
        : Store.fromJson(json['payment__store'] as Map<String, dynamic>),
    uri: json['payment__uri'] == null
        ? null
        : Uri.parse(json['payment__uri'] as String),
    shortUri: json['payment__short_uri'] == null
        ? null
        : Uri.parse(json['payment__short_uri'] as String),
  );
}

Map<String, dynamic> _$_$_PaymentToJson(_$_Payment instance) =>
    <String, dynamic>{
      'payment__id': instance.id,
      'payment__customer': instance.customer,
      'payment__cashier': instance.cashier,
      'payment__price': instance.price,
      'payment__payment_method': instance.paymentMethod,
      'payment__timestamp':
          const TimestampConverter().toJson(instance.timestamp),
      'payment__business': instance.business,
      'payment__store': instance.store,
      'payment__uri': instance.uri?.toString(),
      'payment__short_uri': instance.shortUri?.toString(),
    };
