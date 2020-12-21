import 'package:flutter_test/flutter_test.dart';
import '../../lib/extensions/string_extensions.dart';

void main() {
  test("1000 -> 1000 getPlainNum", () {
    expect("1000".getPlainNum(), equals("1000"));
  });

  test("1,000 -> 1000 getPlainNum", () {
    expect("1,000".getPlainNum(), equals("1000"));
  });

  test("1,000.23 -> 100023 getPlainNum", () {
    expect("1,000.23".getPlainNum(), equals("100023"));
  });

  test("1,000,457.98 -> 100045798 getPlainNum", () {
    expect("1,000,457.98".getPlainNum(), equals("100045798"));
  });

  test("1,000,789,000.23 -> 100078900023 getPlainNum", () {
    expect("1,000,789,000.23".getPlainNum(), equals("100078900023"));
  });

  test("getPlainNum empty string", () {
    expect("".getPlainNum(), equals(""));
  });

  test("getPlainNum on NULL", () {
    expect(null.getPlainNum(), equals(""));
  });

  test("getPlainNum BigIntParse", () {
    expect(BigInt.tryParse("".getPlainNum()), equals(null));
    expect(
      BigInt.tryParse("1,000.00".getPlainNum()),
      equals(BigInt.from(100000)),
    );
    expect(
      BigInt.tryParse("10,000.23".getPlainNum()),
      equals(BigInt.from(1000023)),
    );
    expect(
      BigInt.tryParse("100,123.78".getPlainNum()),
      equals(BigInt.from(10012378)),
    );
    expect(
      BigInt.tryParse("1,123,000.23".getPlainNum()),
      equals(BigInt.from(112300023)),
    );
    expect(
      BigInt.tryParse("1,000,789,123.00".getPlainNum()),
      equals(BigInt.from(100078912300)),
    );
    expect(
      BigInt.tryParse("1,000,789,123,456.00".getPlainNum()),
      equals(BigInt.from(100078912345600)),
    );
  });

  test("BigInt.tryParse getPlainNum()", () {
    final BigInt test = BigInt.tryParse("".getPlainNum()) ?? BigInt.zero;
    final BigInt test2 = BigInt.tryParse(null.getPlainNum()) ?? BigInt.zero;
    expect(test, equals(BigInt.zero));
    expect(test2, equals(BigInt.zero));
  });
}
