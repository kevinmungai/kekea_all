import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../business_member/business_member.dart';
import '../person/person.dart';
import '../../converters/timestamp_converter.dart';
import '../../utils/constants.dart' as c;
part 'store_reservation.freezed.dart';
part 'store_reservation.g.dart';

@freezed
abstract class StoreReservation with _$StoreReservation {
  const factory StoreReservation({
    @JsonKey(name: c.storeReservationId) String id,
    @required @JsonKey(name: c.storeReservationCustomer) Person customer,
    @required @JsonKey(name: c.storeReservationCashier) BusinessMember cashier,
    @required
    @JsonKey(name: c.storeReservationStartTime)
    @TimestampConverter()
        Timestamp startTime,
    @required
    @JsonKey(name: c.storeReservationEndTime)
    @TimestampConverter()
        Timestamp endTime,
    @JsonKey(name: c.storeReservationProducts)
        List<StoreReservation> storeReservationProducts,
  }) = _StoreReservation;

  factory StoreReservation.fromJson(Map<String, dynamic> json) =>
      _$StoreReservationFromJson(json);
}
