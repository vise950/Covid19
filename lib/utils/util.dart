import 'package:intl/intl.dart';

class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy';

  static String formattedDate(String date) {
    DateTime _dateTime = DateTime.parse(date);
    return DateFormat(DATE_FORMAT).format(_dateTime);
  }
}
