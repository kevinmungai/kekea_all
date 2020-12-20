import 'package:intl/intl.dart';

String getDateFormat(DateTime dateTime) {
  assert(dateTime != null);

  final DateFormat dateFormat = DateFormat.jm();

  final DateFormat yearFormat = DateFormat.d().add_yMMMM();

  final String dateString = dateFormat.format(dateTime);
  final String yearString = yearFormat.format(dateTime);

  return "$dateString, $yearString";
}
