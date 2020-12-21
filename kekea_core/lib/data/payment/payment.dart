import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business/business.dart';
import 'package:kekea_core/data/store/store.dart';
import '../business_person/business_person.dart';
import '../customer/customer.dart';
import '../payment_method/payment_method.dart';
import '../price/price.dart';
import '../../converters/timestamp_converter.dart';
import '../../utils/constants.dart' as c;

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    @JsonKey(name: c.paymentId) String id,
    @required @JsonKey(name: c.paymentCustomer) Customer customer,
    @required @JsonKey(name: c.paymentCashier) BusinessPerson cashier,
    @required @JsonKey(name: c.paymentPrice) Price price,
    @required
    @JsonKey(name: c.paymentPaymentMethod)
        PaymentMethod paymentMethod,
    @required
    @JsonKey(name: c.paymentTimeStamp)
    @TimestampConverter()
        Timestamp timestamp,

    /// TODO: ADD BUSINESS AND STORE SO THAT THE CUSTOMER CAN KNOW WHICH BUSINESS
    /// AND STORE THEY INTERACTED WITH.
    @JsonKey(name: c.paymentBusiness) Business business,
    @JsonKey(name: c.paymentStore) Store store,
    @JsonKey(name: c.paymentUri) Uri uri,
    @JsonKey(name: c.paymentShortUri) Uri shortUri,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
