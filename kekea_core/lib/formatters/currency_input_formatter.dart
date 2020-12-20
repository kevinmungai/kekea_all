import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/**
 * Copied from a
 * [gist](https://gist.github.com/andre-bahia/14fdb0c751822f848a364b3129df1fedz)
 * and inspired by a [stackoverflow answer](https://stackoverflow.com/a/16505472/5288415)
 * 
 * maybe a locale for [**en_KE**](https://www.localeplanet.com/icu/en-KE/index.html) 
 * would help checkout the [intl library on github](https://github.com/dart-lang/intl/blob/master/lib/number_symbols_data.dart)
 * if you want to help out
 */
class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00");
    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
