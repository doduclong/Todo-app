import 'package:intl/intl.dart';

class DatetimeConvert{
  static DateTime? toDateTime(String? date) {
    if (date == null) return null;
    try {
      return DateTime.parse(date);
    } catch (e) {
      return null;
    }
  }

  static String? datetimeToString(DateTime? date) {
    if (date == null) return null;
    String formattedTime12h = DateFormat.jm().format(date);
    return formattedTime12h;
  }
}