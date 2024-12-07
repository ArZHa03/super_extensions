part of 'super_extensions.dart';

extension DynamicExt on dynamic {
  bool? get isBlank => _SuperExtensions.isBlank(this);
  bool get isOneAKind => _SuperExtensions.isOneAKind(this);

  void printError({String info = '', Function logFunction = _SuperExtensions.printFunction}) =>
      logFunction('Error: $runtimeType', this, info, isError: true);

  void printInfo({String info = '', Function printFunction = _SuperExtensions.printFunction}) =>
      printFunction('Info: $runtimeType', this, info);

  bool get isNull => this == null;
  bool get isNotNull => this != null;

  bool get isInt => this is int;
  bool get isDouble => this is double;
  bool get isNum => this is num;
  bool get isBool => this is bool;
  bool get isString => this is String;
  bool get isList => this is List;
  bool get isMap => this is Map;
  bool get isIterable => this is Iterable;
  bool get isDateTime => this is DateTime;
  bool get isDuration => this is Duration;
  bool get isFunction => this is Function;
  bool get isFuture => this is Future;
}
