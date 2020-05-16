import 'package:intl/intl.dart';

extension ListExtension on List<dynamic> {
  List reverse() {
    if (this != null)
      return this.reversed.toList();
    else
      return List();
  }
}

extension StringExtension on String {
  static const DATE_FORMAT = 'dd/MM/yyyy';
  static const DATE_FORMAT_FOR_ID = 'yyyyMMdd';
  static const DATE_FORMAT_TEXT = 'EEEE d MMMM yyyy';
  static const DATE_FORMAT_WITH_HOUR = 'dd/MM/yyyy HH:mm';

  formatDate(String pattern) {
    if (this != null) {
      DateTime _dateTime = DateTime.parse(this);
      return DateFormat(pattern).format(_dateTime);
    }
  }

  get toID {
    if (this != null) {
      DateTime _dateTime = DateTime.parse(this);
      var id = DateFormat(DATE_FORMAT_FOR_ID).format(_dateTime);
      return int.tryParse(id);
    }
  }
}
