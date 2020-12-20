import 'package:meta/meta.dart';

/**
 * formats the amount to include commas
 * 
 * NOTE: `amount` is in `cents` which is the lowest denomination in Kenya.
 * 
 * Which means passing `100000` is going to become `1,000`.
 * 
 * ```
 * formatAmount(BigInt.from(100000)) \\ 1,000
 * formatAmount(BigInt.from(100000), addCents: true) \\ 1,000.00
 * ```
 */
String formatAmount({
  @required BigInt amount,
  bool addCents = false,
}) {
  assert(amount != null);
  assert(addCents != null);

  final String amountInString = amount.toString();

  if (amountInString.length <= 3) {
    return smallNumFormat(amountInString);
  } else {
    final res = removeWeirdFirstComma(
      amountInString: formatHelper(
        amountInString: amountInString.substring(0, amountInString.length - 2),
      ),
    );
    final possibleZero = amountInString.substring(amountInString.length - 2);

    if (addCents) {
      return "$res.$possibleZero";
    } else {
      final BigInt possibleZeroBigInt =
          BigInt.tryParse(possibleZero) ?? BigInt.zero;

      if (possibleZeroBigInt == BigInt.zero) {
        return res;
      } else {
        return "$res.$possibleZero";
      }
    }
  }
}

String formatHelper({
  @required String amountInString,
}) {
  assert(amountInString != null);

  return amountInString
      .splitIntoCharStrings()
      .reversed
      .toList()
      .getChunks(3)
      .map((e) => e.reversed.join(""))
      .toList()
      .reversed
      .join(",");
}

extension ToSubStrings on String {
  /** splits a string to into character sub strings
  *  ```
  *  "Dart".splitIntoCharStrings() \\ ["D", "a", "r", "t"]
  *  ```
  */
  List<String> splitIntoCharStrings() {
    assert(this != null);

    List<String> res = [];

    for (var i = 0; i < this.length; i++) {
      res.add(this[i]);
    }

    return res;
  }
}

extension ChunkLists<T> on List<T> {
  /**
   * Divides a list into chunks. Each chunk length
   * is at least less than or equal to `size`.
   * 
   * ```
   * [1, 2, 3].getChunks(2) \\ [[1, 2], [3]]
   * ```
   */
  List<List<T>> getChunks(int size) {
    assert(this != null);
    assert(size != null);

    List<List<T>> res = [];
    List<T> temp = [];

    this.forEach((T item) {
      if (temp.length < size) {
        temp.add(item);
      } else {
        res.add(temp);
        temp = [];
        temp.add(item);
      }
    });

    if (temp.isNotEmpty) {
      res.add(temp);
    }

    return res;
  }
}

String removeWeirdFirstComma({
  @required String amountInString,
}) {
  if (amountInString != null) {
    final bool hasWeirdFirstComma = amountInString.startsWith("-,");

    if (hasWeirdFirstComma) {
      return amountInString.replaceFirst(RegExp(r','), '');
    }
  }

  return amountInString;
}

String smallNumFormat(String smallNum) {
  if (smallNum != null) {
    if (smallNum.isNotEmpty) {
      final bool isNegative = smallNum.startsWith("-");

      if (isNegative) {
        final negativeRemoved = smallNum.replaceFirst(RegExp(r'-'), '');
        if (smallNum.length == 2) {
          return "-0.0$negativeRemoved";
        }

        if (smallNum.length == 3) {
          return "-0.$negativeRemoved";
        }
      } else {
        if (smallNum.length == 1) {
          return "0.0$smallNum";
        }
        if (smallNum.length == 2) {
          return "0.$smallNum";
        }

        if (smallNum.length == 3) {
          return smallNum3Positive(smallNum);
        }
      }
    }
  }

  return "0.00";
}

String smallNum3Positive(String smallNum) {
  if (smallNum != null) {
    if (smallNum.length == 3) {
      final String first = smallNum[0];
      final String last = smallNum.substring(1);

      return "0$first.$last";
    }
  }
  return "00.00";
}
