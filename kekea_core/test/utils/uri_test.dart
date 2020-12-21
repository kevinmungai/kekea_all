import 'package:flutter_test/flutter_test.dart';
import 'package:kekea_core/utils/uri.dart';

void main() {
  test("uri test", () {
    final String paymentId = "92873KDF3JA";
    final String paymentIdTwo = "98DKF8939HFEN";
    expect(getReceiptUri(paymentId).toString(),
        equals("https://kekea/receipts?id=$paymentId"));
    expect(getReceiptUri(paymentIdTwo).toString(),
        equals("https://kekea/receipts?id=$paymentIdTwo"));
  });

  test("uri dynamic link page link", () {
    expect(getPageLink().toString(), equals("https://kekea7.page.link"));
  });

  test("is receipt uri", () {
    expect(isReceiptUri(getReceiptUri("2343")), equals(true));
    expect(isReceiptUri(getPageLink()), equals(false));
  });
}
