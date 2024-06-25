import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toDayMonthYear() {
    final DateFormat formatter = DateFormat('d MMMM y');
    return formatter.format(this);
  }

  String toHourMinutes() {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(this);
  }
}
