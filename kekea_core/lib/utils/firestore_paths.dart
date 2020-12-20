import 'package:meta/meta.dart';

/// person paths
///
/// /person/
const String personCollectionPath = "person";

/// /person/personId/
String personDocumentPath(String personId) => "$personCollectionPath/$personId";

///

/// business paths
///
/// /business/
const String businessCollectionPath = "business";

/// /business/businessId/
String businessDocumentPath(String businessId) =>
    "$businessCollectionPath/$businessId";

/// /business/businessId/business_member/
String businessMemberCollectionPath(String businessId) =>
    "${businessDocumentPath(businessId)}/business_member";

/// /business/businessId/business_member/businessMemberId/
String businessMemberDocumentPath({
  @required String businessId,
  @required String businessMemberId,
}) =>
    "${businessMemberCollectionPath(businessId)}/$businessMemberId";

/// /business/businessId/store/
String storeCollectionPath(String businessId) =>
    "${businessDocumentPath(businessId)}/store";

/// /business/businessId/store/storeId/
String storeDocumentPath({
  @required String businessId,
  @required String storeId,
}) =>
    "${storeCollectionPath(businessId)}/$storeId";

/// /business/businessId/store/storeId/product/
String productCollectionPath({
  @required String businessId,
  @required String storeId,
}) =>
    "${storeDocumentPath(businessId: businessId, storeId: storeId)}/product";

/// /business/businessId/store/storeId/product/productId/
String productDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String productId,
}) {
  final res = productCollectionPath(
    businessId: businessId,
    storeId: storeId,
  );
  return "$res/$productId";
}

/// /business/businessId/store/storeId/payment/
String paymentCollectionPath({
  @required String businessId,
  @required String storeId,
}) {
  final res = storeDocumentPath(
    businessId: businessId,
    storeId: storeId,
  );
  return "$res/payment";
}

/// /business/businessId/store/storeId/payment/paymentId
String paymentDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String paymentId,
}) {
  final res = paymentCollectionPath(
    businessId: businessId,
    storeId: storeId,
  );
  return "$res/$paymentId";
}

/// /business/businessId/store/storeId/payment/paymentId/payment_product/
String paymentProductCollectionPath({
  @required String businessId,
  @required String storeId,
  @required String paymentId,
}) {
  final res = paymentDocumentPath(
    businessId: businessId,
    storeId: storeId,
    paymentId: paymentId,
  );
  return "$res/payment_product";
}

/// /business/businessId/store/storeId/payment/paymentId/payment_product/payment_productId/
String paymentProductDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String paymentId,
  @required String paymentProductId,
}) {
  final res = paymentProductCollectionPath(
    businessId: businessId,
    storeId: storeId,
    paymentId: paymentId,
  );
  return "$res/$paymentProductId";
}

/// /business/businessId/store/storeId/store_reservation/
String storeReservationCollectionPath({
  @required String businessId,
  @required String storeId,
}) {
  final res = storeDocumentPath(
    businessId: businessId,
    storeId: storeId,
  );
  return "$res/store_reservation";
}

/// /business/businessId/store/storeId/store_reservation/store_reservationId/
String storeReservationDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String storeReservationId,
}) {
  final res = storeReservationCollectionPath(
    businessId: businessId,
    storeId: storeId,
  );
  return "$res/$storeReservationId";
}

/// /business/businessId/store/storeId/store_reservation/store_reservationId/store_reservation_product
String storeReservationProductCollectionPath({
  @required String businessId,
  @required String storeId,
  @required String storeReservationId,
}) {
  final res = storeReservationDocumentPath(
    businessId: businessId,
    storeId: storeId,
    storeReservationId: storeReservationId,
  );
  return "$res/store_reservation_product";
}

/// /business/businesId/store/storeId/store_reservation/store_reservationId/store_reservation_product/store_reservation_productId
String storeReservationProductDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String storeReservationId,
  @required String storeReservationProductId,
}) {
  final res = storeReservationProductCollectionPath(
    businessId: businessId,
    storeId: storeId,
    storeReservationId: storeReservationId,
  );

  return "$res/$storeReservationProductId";
}

/// /business/businessId/store/storeId/shrinkage/
String shrinkageCollectionPath({
  @required String businessId,
  @required String storeId,
}) {
  final res = storeDocumentPath(
    businessId: businessId,
    storeId: storeId,
  );

  return "$res/shrinkage";
}

/// /business/businessId/store/storeId/shrinkage/shrinkageId/
String shrinkageDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String shrinkageId,
}) {
  final res = shrinkageCollectionPath(
    businessId: businessId,
    storeId: storeId,
  );

  return "$res/$shrinkageId";
}

/// /business/businessId/store/storeId/shrinkage/shrinkageId/shrinkage_product
String shrinkageProductCollectionPath({
  @required String businessId,
  @required String storeId,
  @required String shrinkageId,
}) {
  final res = shrinkageDocumentPath(
    businessId: businessId,
    storeId: storeId,
    shrinkageId: shrinkageId,
  );

  return "$res/shrinkage_product";
}

/// /business/businessId/store/storeId/shrinkage/shrinkageId/shrinkage_product/shrinkage_productId
String shrinkageProductDocumentPath({
  @required String businessId,
  @required String storeId,
  @required String shrinkageId,
  @required String shrinkageProductId,
}) {
  final res = shrinkageProductCollectionPath(
    businessId: businessId,
    storeId: storeId,
    shrinkageId: shrinkageId,
  );

  return "$res/$shrinkageProductId";
}

///
///
/// currency paths start
///
/// /currency/
const String currencyCollectionPath = "currency";

/// /currency/currencyId/
String currencyDocumentPath(String currencyId) {
  return "$currencyCollectionPath/$currencyId";
}

/// currency paths end

/// tax paths start
/// /tax/
const String taxCollectionPath = "tax";

/// /tax/taxId/
String taxDocumentPath(String taxId) {
  return "$taxCollectionPath/$taxId";
}

/// tax paths end

/// payment_method paths start
///
/// /payment_method/
const String paymentMethodCollectionPath = "payment_method";

/// /payment_method/payment_methodId/
String paymentMethodDocumentPath(String paymentMethodId) {
  return "$paymentMethodCollectionPath/$paymentMethodId";
}

/// payment_method paths end

/// store_event_type paths start
///
/// /store_event_type/
const String storeEventTypeCollectionPath = "store_event_type";

/// /store_event_type/store_event_typeId/
String storeEventTypeDocumentPath(String storeEventId) {
  return "$storeEventTypeCollectionPath/$storeEventId";
}

/// store_event_type paths end

/// shrinkage_type paths start
///
/// /shrinkage_type/
const String shrinkageTypeCollectionPath = "shrinkage_type";

/// /shrinkage_type/shrinkage_typeId/
String shrinkageTypeDocumentPath(String shrinkageTypeId) {
  return "$shrinkageTypeCollectionPath/$shrinkageTypeId";
}

/// shrinkage_type paths end

/// business_person paths start
/// /business_person/
const String businessPersonCollectionPath = "business_person";

/// /business_person/business_personId/
String businessPersonDocumentPath(String businessPersonId) {
  assert(
    businessPersonId != null,
    "businessPersonId cannot be null",
  );
  assert(
    businessPersonId.isNotEmpty,
    "businessPersonId cannot be empty",
  );

  return "$businessPersonCollectionPath/$businessPersonId";
}

/// /business_person/business_personId/business_person_businesses/
String businessPersonBusinessesCollectionPath(
  String businessPersonId,
) {
  final res = businessPersonDocumentPath(businessPersonId);
  return "$res/business_person_businesses";
}

/// /business_person/business_person_id/business_person_businesses/business_person_businessesId/
String businessPersonBusinessesDocumentPath({
  @required String businessPersonId,
  @required String businessPersonBusinessesId,
}) {
  assert(
    businessPersonBusinessesId != null,
    "businessPersonBusinessesId cannot be null",
  );
  assert(
    businessPersonBusinessesId.isNotEmpty,
    "businessPersonBusinessesId cannot be empty",
  );

  final res = businessPersonBusinessesCollectionPath(businessPersonId);

  return "$res/$businessPersonBusinessesId";
}

/// business_person paths end
