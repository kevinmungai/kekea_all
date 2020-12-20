import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/customer/customer.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/data/business_person/business_person.dart';

part 'business_person_status_event.freezed.dart';

@freezed
abstract class BusinessPersonStatusEvent with _$BusinessPersonStatusEvent {
  const factory BusinessPersonStatusEvent.listenToChanges({
    @required String firebaseId,
  }) = _Listen;
  const factory BusinessPersonStatusEvent.setPresent({
    @required BusinessPerson businessPerson,
  }) = _SetPresent;
  const factory BusinessPersonStatusEvent.setAbsent({
    @required String firebaseId,
  }) = _SetAbsent;
  const factory BusinessPersonStatusEvent.stopListening() = _StopListening;
  const factory BusinessPersonStatusEvent.setDefaultBusiness({
    @required String defaultBusiness,
  }) = _SetDefaultBusiness;
  const factory BusinessPersonStatusEvent.createBusinessMember({
    @required String businessId,
  }) = _CreateBusinessMember;
  const factory BusinessPersonStatusEvent.setDefaultStore({
    @required String storeId,
    @required String businessId,
  }) = _CreateStore;
  const factory BusinessPersonStatusEvent.submitPayment({
    @required PaymentMethod paymentMethod,
    @required Customer customer,
  }) = _SubmitPayment;
}
