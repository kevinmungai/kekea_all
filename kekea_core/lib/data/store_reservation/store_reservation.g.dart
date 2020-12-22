// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreReservation _$_$_StoreReservationFromJson(Map json) {
  return _$_StoreReservation(
    id: json['store_reservation__id'] as String,
    customer: json['store_reservation__customer'] == null
        ? null
        : Person.fromJson((json['store_reservation__customer'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    cashier: json['store_reservation__cashier'] == null
        ? null
        : BusinessMember.fromJson(
            (json['store_reservation__cashier'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    startTime: const TimestampConverter()
        .fromJson(json['store_reservation__start_time'] as Timestamp),
    endTime: const TimestampConverter()
        .fromJson(json['store_reservation__end_time'] as Timestamp),
    storeReservationProducts: (json['store_reservation__products'] as List)
        ?.map((e) => e == null
            ? null
            : StoreReservation.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_StoreReservationToJson(_$_StoreReservation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('store_reservation__id', instance.id);
  writeNotNull('store_reservation__customer', instance.customer?.toJson());
  writeNotNull('store_reservation__cashier', instance.cashier?.toJson());
  writeNotNull('store_reservation__start_time',
      const TimestampConverter().toJson(instance.startTime));
  writeNotNull('store_reservation__end_time',
      const TimestampConverter().toJson(instance.endTime));
  writeNotNull('store_reservation__products',
      instance.storeReservationProducts?.map((e) => e?.toJson())?.toList());
  return val;
}
