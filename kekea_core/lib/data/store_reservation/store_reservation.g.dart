// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreReservation _$_$_StoreReservationFromJson(Map<String, dynamic> json) {
  return _$_StoreReservation(
    id: json['store_reservation__id'] as String,
    customer: json['store_reservation__customer'] == null
        ? null
        : Person.fromJson(
            json['store_reservation__customer'] as Map<String, dynamic>),
    cashier: json['store_reservation__cashier'] == null
        ? null
        : BusinessMember.fromJson(
            json['store_reservation__cashier'] as Map<String, dynamic>),
    startTime: const TimestampConverter()
        .fromJson(json['store_reservation__start_time'] as Timestamp),
    endTime: const TimestampConverter()
        .fromJson(json['store_reservation__end_time'] as Timestamp),
    storeReservationProducts: (json['store_reservation__products'] as List)
        ?.map((e) => e == null
            ? null
            : StoreReservation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_StoreReservationToJson(
        _$_StoreReservation instance) =>
    <String, dynamic>{
      'store_reservation__id': instance.id,
      'store_reservation__customer': instance.customer,
      'store_reservation__cashier': instance.cashier,
      'store_reservation__start_time':
          const TimestampConverter().toJson(instance.startTime),
      'store_reservation__end_time':
          const TimestampConverter().toJson(instance.endTime),
      'store_reservation__products': instance.storeReservationProducts,
    };
