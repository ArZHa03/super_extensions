part of 'super_extensions.dart';

extension DurationExt on Duration {
  Future delay([FutureOr Function()? callback]) async => Future.delayed(this, callback);
  String get timeToString => toString().split('.').first.padLeft(8, '0');
  String get timeToStringWithMs => toString().split('.').first.padLeft(12, '0');
  String get timeToStringWithUs => toString().split('.').first.padLeft(15, '0');
  String get timeToStringWithNs => toString().split('.').first.padLeft(18, '0');
  String get timeToStringWithMsAndUs => toString().split('.').first.padLeft(15, '0').replaceRange(12, 15, '.');
  String get timeToStringWithMsAndNs => toString().split('.').first.padLeft(18, '0').replaceRange(12, 18, '.');
  String get timeToStringWithUsAndNs => toString().split('.').first.padLeft(18, '0').replaceRange(15, 18, '.');
  String get timeToStringWithMsUsAndNs => toString().split('.').first.padLeft(21, '0').replaceRange(12, 21, '.');
  String get timeToStringWithMsUsAndNsAndComma =>
      toString().split('.').first.padLeft(21, '0').replaceRange(12, 21, ',');
  String get timeToStringWithUsAndNsAndComma => toString().split('.').first.padLeft(18, '0').replaceRange(15, 18, ',');
  String get timeToStringWithMsAndNsAndComma => toString().split('.').first.padLeft(18, '0').replaceRange(12, 18, ',');
}
