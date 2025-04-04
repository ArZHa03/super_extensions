part of 'super_extensions.dart';

extension DoubleExt on double {
  double toPrecision(int fractionDigits) {
    var mod = math.pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }

  Duration get milliseconds => Duration(microseconds: (this * 1000).round());
  Duration get ms => milliseconds;
  Duration get seconds => Duration(milliseconds: (this * 1000).round());
  Duration get minutes => Duration(seconds: (this * Duration.secondsPerMinute).round());
  Duration get hours => Duration(minutes: (this * Duration.minutesPerHour).round());
  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());

  double get abs => math.sqrt(this).abs();
  double get sign => math.sqrt(this).sign;
}
