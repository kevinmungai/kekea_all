import 'package:flutter/services.dart';
import '../extensions/string_extensions.dart';

class MaxInputFormatter extends TextInputFormatter {
  final BigInt max;

  MaxInputFormatter(
    this.max,
  ) : assert(max != null);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String plainNum = newValue.text.getPlainNum();

    final BigInt parsed = BigInt.tryParse(plainNum);

    if (parsed != null) {
      if (parsed > max) {
        return newValue.copyWith(
          text: "0.00",
          selection: TextSelection.collapsed(
            offset: "0.00".length,
          ),
        );
      }
    }

    return newValue;
  }
}
