import 'package:flutter_test/flutter_test.dart';
import '../../lib/formatters/date_formatter.dart';

void main() {
  final DateTime dateTime = DateTime(2020, DateTime.april, 10, 8, 4, 23);
  final DateTime dateTime2 = DateTime(2020, DateTime.december, 12, 13, 19);

  test("testing formatter with local time AM", () {
    expect(getDateFormat(dateTime), equals("8:04 AM, 10 April 2020"));
  });

  test("testing formatter with local time PM", () {
    expect(getDateFormat(dateTime2), equals("1:19 PM, 12 December 2020"));
  });
}
