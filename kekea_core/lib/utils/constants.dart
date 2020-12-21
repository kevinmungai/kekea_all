/// business constants
const String businessId = "business__id";
const String businessName = "business__name";

/// person constants
const String personPhone = "person__phone";
const String personEmail = "person__email";
const String personName = "person__name";
const String personId = "person__id";

/// business_person constants
const String businessPersonName = "business_person__name";
const String businessPersonEmail = "business_person__email";
const String businessPersonPhone = "business_person__phone";
const String businessPersonFirebaseId = "business_person__firebase_id";
const String businessPersonDefaultStore = "business_person__default_store";
const String businessPersonDefaultBusiness =
    "business_person__default_business";

/// business_person_business constants
const String businessPersonBusinessName = "business_person_businesses__name";
const String businessPersonBusinessId = "business_person_businesses__id";
const String businessPersonBusinessDefault =
    "business_person_businesses__default";
const String businessPersonBusinessDefaultValue = "default";

/// business_member constants
const String businessMemberId = "business_member__id";
const String businessMemberName = "business_member__name";
const String businessMemberFirebaseId = "business_member__firebase_id";
const String businessMemberPhone = "business_member__phone";
const String businessMemberEmail = "business_member__email";

/// store constants
const String storeName = "store__name";
const String storePlace = "store__place";
const String storeId = "store__id";

/// product constants
const String productId = "product__id";
const String productName = "product__name";
const String productDescription = "product__description";
const String productPhoto = "product__photo";
const String productPrice = "product__price";
const String productQuantity = "product__quantity";
const String productTax = "product__tax";

/// payment constants
const String payment = "payment";
const String paymentId = "payment__id";
const String paymentCustomer = "payment__customer";
const String paymentCashier = "payment__cashier";
const String paymentPrice = "payment__price";
const String paymentPaymentMethod = "payment__payment_method";
const String paymentTimeStamp = "payment__timestamp";
const String paymentBusiness = "payment__business";
const String paymentStore = "payment__store";
const String paymentUri = "payment__uri";
const String paymentShortUri = "payment__short_uri";
// const String paymentProducts = "payment__products";

/// payment_product constants
const String paymentProduct = "payment_product";
const String paymentProductId = "payment_product__id";
const String paymentProductName = "payment_product__name";
const String paymentProductPrice = "payment_product__price";
const String paymentProductTax = "payment_product__tax";
const String paymentProductRefId = "payment_product__ref_id";
const String paymentProductQuantity = "payment_product__quantity";
const String paymentProductDiscount = "payment_product__discount";

/// payment_method constants
const String paymentMethodId = "payment_method__id";
const String paymentMethodName = "payment_method__name";
const String paymentMethodDisplayText = "payment_method__display_text";
const String paymentMethodDescription = "payment_method__description";

/**
 * Payment Method Union Key in Cloud Firestore
 */
const String paymentMethodUnionKey = "payment_method__union_key";

/// store_reservation constants
const String storeReservationId = "store_reservation__id";
const String storeReservationCustomer = "store_reservation__customer";
const String storeReservationCashier = "store_reservation__cashier";
const String storeReservationStartTime = "store_reservation__start_time";
const String storeReservationEndTime = "store_reservation__end_time";
const String storeReservationProducts = "store_reservation__products";

/// store_reservation_product constants
const String storeReservationProductId = "store_reservation_product__id";
const String storeReservationProductName = "store_reservation_product__name";
const String storeReservationProductQuantity =
    "store_reservation_product__quantity";
const String storeReservationProductRefId = "store_product_reservation__ref_id";

/// shrinkage constants
const String shrinkageId = "shrinkage__id";
const String shrinkageReportingTime = "shrinkage__reporting_time";
const String shrinkageOccurrenceTime = "shrinkage__occurrence_time";
const String shrinkageReporter = "shrinkage__reporter";
const String shrinkageShrinkageTypes = "shrinkage__shrinkage_types";
const String shrinkageDescription = "shrinkage__description";
const String shrinkageProducts = "shrinkage__products";

/// shrinkage_product constants
const String shrinkageProductId = "shrinkage_product__id";
const String shrinkageProductName = "shrinkage_product__name";
const String shrinkageProductQuantity = "shrinkage_product__quantity";
const String shrinkageProductRefId = "shrinkage_product__ref_id";

/// currency constants
const String currencyId = "currency__id";
const String currencyText = "currency__text";

/// tax constants
const String taxId = "tax__id";
const String taxName = "tax__name";
const String taxPercentage = "tax__percentage";
const String taxDisplayText = "tax__display_text";
const String taxDescription = "tax__description";

/// shrinkage_type constants
const String shrinkageTypeId = "shrinkage_type__id";
const String shrinkageTypeText = "shrinkage_type__text";
const String shrinkageTypeDescription = "shrinkage_type__description";

/// place constants
const String placeGeoPoint = "place__geopoint";
const String placeStreetName = "place__street_name";
const String placeExtraInfo = "place__extra_info";
const String placePropertyName = "place__property_name";
const String placeDescription = "place__description";
const String placeDirections = "place__directions";

/**
 * Card Requirement constants
 */
const String referenceNumber = "reference_number";

/**
 * Card Requirement Reference Number
 */
const String cardRequirementReferenceNumber =
    "card_requirement__reference_number";

/**
 * Cash Requirement amount given
 */
const String cashRequirementAmountGiven = "cash_requirement__amount_given";
/**
 * Cash Requirement total
 */
const String cashRequirementTotalAmount = "cash_requirement__total_amount";
/**
 * Cash Requirement change
 */
const String cashRequirementChange = "cash_requirement__total";

/**
 * MPESA Reference Number
 */
const String mpesaReferenceNumber = "mpesa_reference_number";

/**
 * MPESA Requirement Reference Number
 */
const String mpesaRequirementReferenceNumber =
    "mpesa_requirement__reference_number";

/**
 * Payment Method Requirement Union Key
 */
const String paymentMethodRequirementUnionKey =
    "payment_method_requirement__union_key";

/// Customer Phone Number
const String customerPhone = "customer_phone";

/**
 * Payment Method Requirement Customer Phone
 */
