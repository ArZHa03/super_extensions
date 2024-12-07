part of 'super_extensions.dart';

extension NumExt on num {
  bool isLowerThan(num b) => _SuperExtensions.isLowerThan(this, b);

  bool isGreaterThan(num b) => _SuperExtensions.isGreaterThan(this, b);

  bool isEqual(num b) => _SuperExtensions.isEqual(this, b);

  Future delay([FutureOr Function()? callback]) async =>
      await Future.delayed(Duration(milliseconds: (this * 1000).round()), callback);
}
