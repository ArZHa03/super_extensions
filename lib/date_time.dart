part of 'super_extensions.dart';

extension DateTimeExt on DateTime {
  DateTime addDays(int days) => add(Duration(days: days));
  DateTime addHours(int hours) => add(Duration(hours: hours));
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));
  DateTime addSeconds(int seconds) => add(Duration(seconds: seconds));
  DateTime addMilliseconds(int milliseconds) => add(Duration(milliseconds: milliseconds));
  DateTime addMicroseconds(int microseconds) => add(Duration(microseconds: microseconds));

  DateTime subtractDays(int days) => subtract(Duration(days: days));
  DateTime subtractHours(int hours) => subtract(Duration(hours: hours));
  DateTime subtractMinutes(int minutes) => subtract(Duration(minutes: minutes));
  DateTime subtractSeconds(int seconds) => subtract(Duration(seconds: seconds));
  DateTime subtractMilliseconds(int milliseconds) => subtract(Duration(milliseconds: milliseconds));
  DateTime subtractMicroseconds(int microseconds) => subtract(Duration(microseconds: microseconds));

  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999, 999);
  DateTime get startOfMonth => DateTime(year, month, 1);
  DateTime get endOfMonth => DateTime(year, month + 1, 0, 23, 59, 59, 999, 999);
  DateTime get startOfYear => DateTime(year, 1, 1);
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59, 999, 999);

  bool isSameDay(DateTime other) => year == other.year && month == other.month && day == other.day;
  bool isSameMonth(DateTime other) => year == other.year && month == other.month;
  bool isSameYear(DateTime other) => year == other.year;

  bool isToday() => isSameDay(DateTime.now());
  bool isYesterday() => isSameDay(DateTime.now().subtract(Duration(days: 1)));
  bool isTomorrow() => isSameDay(DateTime.now().add(Duration(days: 1)));

  bool isThisMonth() => isSameMonth(DateTime.now());
  bool isThisYear() => isSameYear(DateTime.now());

  bool isWeekend() => [DateTime.saturday, DateTime.sunday].contains(weekday);
  bool isWeekday() => !isWeekend();

  bool isLeapYear() => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  int get daysInMonth {
    if (month == 2) return isLeapYear() ? 29 : 28;
    return [1, 3, 5, 7, 8, 10, 12].contains(month) ? 31 : 30;
  }

  int get daysInYear => isLeapYear() ? 366 : 365;

  int get weekNumber {
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int days = difference(firstDayOfYear).inDays;
    return ((days - (days % 7)) / 7).ceil() + 1;
  }

  int get quarter => ((month - 1) / 3).ceil();
}
