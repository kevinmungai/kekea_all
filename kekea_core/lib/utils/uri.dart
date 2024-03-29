Uri getReceiptUri(
  String paymentId,
) {
  assert(paymentId != null);
  assert(paymentId.isNotEmpty);

  return Uri.https(
    "kekea",
    "receipts",
    {"id": paymentId},
  );
}

Uri getPageLink() {
  return Uri.https("kekea7.page.link", "");
}

const String packageNameCustomer = "com.kekea.customer.kekea_customer";
const String bundleIdCustomer = "com.kekea.customer.kekeaCustomer";

/// Does the Uri belong to the "receipts"?
///
/// Or does it look like begin with https://kekea/receipts
bool isReceiptUri(Uri uri) {
  final String authority = uri?.authority;
  final String path = uri?.path;

  if (authority == "kekea" && path == "/receipts") {
    return true;
  }

  return false;
}
