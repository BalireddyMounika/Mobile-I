import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  bool? isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isAfter(dateTime);
    }
    return null;
  }

  bool? isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = date.year == dateTime.year &&
          date.month == dateTime.month &&
          date.day == dateTime.day;
      return isAtSameMomentAs | date.isBefore(dateTime);
    }
    return null;
  }

  bool isBetween(
    var fromDateTime,
    var toDateTime,
  ) {
    fromDateTime = fromDateTime is String
        ? DateFormat('dd/MM/yyyy').parse(fromDateTime)
        : toDateTime;
    toDateTime = toDateTime is String
        ? DateFormat('dd/MM/yyyy').parse(toDateTime)
        : toDateTime;
    final date = this;
    if (date != null) {
      final isAfter = date.isAfterOrEqualTo(fromDateTime) ?? false;
      final isBefore = date.isBeforeOrEqualTo(toDateTime) ?? false;
      return isAfter && isBefore;
    }
    return false;
  }

  bool isSameDate(var x, var y) {
    DateTime date = this!;
    DateTime one = x is String ? DateFormat('dd/MM/yyyy').parse(x) : x;
    DateTime two = y is String ? DateFormat('dd/MM/yyyy').parse(y) : y;
    date = DateFormat('dd/MM/yyyy')
        .parse("${date.day}/${date.month}/${date.year}");
    return date.isAtSameMomentAs(one) || date.isAtSameMomentAs(two);
  }

  bool isSameAs(String x) {
    DateTime date = this ?? DateTime.now();
    DateTime one = DateFormat('dd/MM/yyyy').parse(x);
    date = DateFormat('dd/MM/yyyy')
        .parse("${date.day}/${date.month}/${date.year}");
    return date.isAtSameMomentAs(one);
  }
}
