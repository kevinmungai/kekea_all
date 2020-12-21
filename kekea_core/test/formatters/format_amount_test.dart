import 'package:flutter_test/flutter_test.dart';
import '../../lib/formatters/format_amount.dart';

void main() {
  final List<String> empty = [];
  test("split empty string", () {
    expect("".splitIntoCharStrings(), equals(empty));
  });

  test("split string", () {
    expect("dart".splitIntoCharStrings(), equals(["d", "a", "r", "t"]));
  });

  test("split number string", () {
    expect("1000".splitIntoCharStrings(), equals(["1", "0", "0", "0"]));
  });

  test("test split number null value", () {
    expect(
      () {
        null.splitIntoCharStrings();
      },
      throwsAssertionError,
    );
  });

  test("test chunk empty list", () {
    expect([].getChunks(3), equals([]));
  });

  test("testing chunk of 1", () {
    expect(
        ["a"].getChunks(1),
        equals([
          ["a"]
        ]));
  });

  test("testing chunks of 2", () {
    final List<String> twos = ["a", "b", "c"];
    expect(
        twos.getChunks(2),
        equals([
          ["a", "b"],
          ["c"]
        ]));
  });

  test("testing chunks of three", () {
    expect(
        ["1", "2", "3", "4", "5", "6", "7"].getChunks(3),
        equals([
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7"]
        ]));
  });

  test("testing chunks of 4", () {
    expect(
        ["1", "2", "3", "4", "5"].getChunks(4),
        equals([
          ["1", "2", "3", "4"],
          ["5"]
        ]));
  });

  test("testing chunk of null", () {
    expect(
      () {
        null.getChunks(1);
      },
      throwsAssertionError,
    );

    expect(
      () {
        [1].getChunks(null);
      },
      throwsAssertionError,
    );
  });

  test("formatHelper", () {
    expect(formatHelper(amountInString: "12345"), equals("12,345"));
    expect(formatHelper(amountInString: "1000"), equals("1,000"));
    expect(formatHelper(amountInString: "10000"), equals("10,000"));
    expect(formatHelper(amountInString: "1000000"), equals("1,000,000"));
    expect(formatHelper(amountInString: "10000000"), equals("10,000,000"));

    expect(
      () {
        formatHelper(amountInString: null);
      },
      throwsAssertionError,
    );
  });

  test("formatAmount", () {
    expect(formatAmount(amount: BigInt.from(23)), equals("0.23"));
    expect(formatAmount(amount: BigInt.from(00)), equals("0.00"));
    expect(formatAmount(amount: BigInt.from(01)), equals("0.01"));
    expect(formatAmount(amount: BigInt.from(1000)), equals("10"));
    expect(
      formatAmount(amount: BigInt.from(1000), addCents: true),
      equals("10.00"),
    );
    expect(formatAmount(amount: BigInt.from(100000)), equals("1,000"));
    expect(
      formatAmount(amount: BigInt.from(100000), addCents: true),
      equals("1,000.00"),
    );
    expect(formatAmount(amount: BigInt.from(10000000)), equals("100,000"));
    expect(formatAmount(amount: BigInt.from(1000000000)), equals("10,000,000"));
    expect(formatAmount(amount: BigInt.from(1234)), equals("12.34"));
    expect(formatAmount(amount: BigInt.from(12345)), equals("123.45"));
    expect(
      formatAmount(amount: BigInt.from(12345), addCents: true),
      equals("123.45"),
    );
    expect(
      formatAmount(amount: BigInt.from(123400), addCents: true),
      equals("1,234.00"),
    );
    expect(formatAmount(amount: BigInt.from(123400)), equals("1,234"));

    expect(
      formatAmount(amount: BigInt.from(12345), addCents: false),
      equals("123.45"),
    );
  });

  test("formatAmount negative", () {
    expect(
      formatAmount(amount: BigInt.from(-12347)),
      equals("-123.47"),
    );

    expect(
      formatAmount(amount: BigInt.from(-12347892)),
      equals("-123,478.92"),
    );

    expect(
      formatAmount(amount: BigInt.from(-01)),
      equals("-0.01"),
    );

    expect(
      formatAmount(amount: BigInt.from(-23)),
      equals("-0.23"),
    );

    expect(
      formatAmount(amount: BigInt.from(-0)),
      equals("0.00"),
    );

    expect(
      formatAmount(amount: BigInt.from(-9)),
      equals("-0.09"),
    );
  });

  test("removeFirstWeirdComma", () {
    expect(
      removeWeirdFirstComma(amountInString: "-,123.00"),
      equals("-123.00"),
    );

    expect(
      removeWeirdFirstComma(amountInString: "123.00"),
      equals("123.00"),
    );

    expect(
      removeWeirdFirstComma(amountInString: "-123"),
      equals("-123"),
    );

    expect(
      removeWeirdFirstComma(amountInString: "-,123,234,354.00"),
      equals("-123,234,354.00"),
    );

    expect(
      removeWeirdFirstComma(amountInString: "-,123,234.00"),
      equals("-123,234.00"),
    );

    expect(
      removeWeirdFirstComma(amountInString: "-12.00"),
      equals("-12.00"),
    );

    expect(
      removeWeirdFirstComma(amountInString: null),
      equals(null),
    );

    expect(removeWeirdFirstComma(amountInString: ""), equals(""));
  });

  test("smallNumFormat Tests", () {
    expect(smallNumFormat("-1"), equals("-0.01"));
    expect(smallNumFormat("-23"), equals("-0.23"));
    expect(smallNumFormat("00"), equals("0.00"));
    expect(smallNumFormat("2"), equals("0.02"));
    expect(smallNumFormat("23"), equals("0.23"));
    expect(smallNumFormat(null), equals("0.00"));
  });
}
