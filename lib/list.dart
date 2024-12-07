part of 'super_extensions.dart';

extension ListExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  T? lastWhereOrNull(bool Function(T element) test) {
    for (var i = length - 1; i >= 0; i--) {
      if (test(this[i])) return this[i];
    }
    return null;
  }

  T? get firstOrNull {
    if (isEmpty) return null;
    return first;
  }

  T? get lastOrNull {
    if (isEmpty) return null;
    return last;
  }

  List<T> whereNotNull() {
    return where((element) => element != null).toList();
  }

  List<T> distinctBy<TProperty>(TProperty Function(T) selector) {
    var set = <TProperty>{};
    return where((element) {
      var property = selector(element);
      return set.add(property);
    }).toList();
  }

  List<T> distinctByString(String Function(T) selector) => distinctBy(selector);
  List<T> distinctByInt(int Function(T) selector) => distinctBy(selector);
  List<T> distinctByDouble(double Function(T) selector) => distinctBy(selector);
  List<T> distinctByBool(bool Function(T) selector) => distinctBy(selector);
  List<T> distinctByDateTime(DateTime Function(T) selector) => distinctBy(selector);
  List<T> distinctByIgnoreCase(String Function(T) selector) {
    var set = <String>{};
    return where((element) {
      var property = selector(element).toLowerCase();
      return set.add(property);
    }).toList();
  }

  List<T> distinctByIgnoreCaseString(String Function(T) selector) => distinctByIgnoreCase(selector);

  num get sum {
    if (isEmpty) return 0;
    return fold(0, (previousValue, element) {
      if (element is num) return previousValue + element;
      return previousValue;
    });
  }

  num get product {
    if (isEmpty) return 0;
    return fold(1, (previousValue, element) {
      if (element is num) return previousValue * element;
      return previousValue;
    });
  }

  num get average {
    if (isEmpty) return 0;
    return sum / length;
  }

  List<T> get reversed => List.of(this.reversed);
  List<T> get shuffled => List.of(this)..shuffle();
  List<T> get rotated => List.of(this)..insertAll(0, this);

  List<T> operator -() => List.of(this.reversed);
  List<T> operator +(List<T> other) => List.of(this)..addAll(other);
  List<T> operator -(List<T> other) => List.of(this)..removeWhere((element) => other.contains(element));
  List<T> operator *(int times) {
    var list = <T>[];
    for (var i = 0; i < times; i++) {
      list.addAll(this);
    }
    return list;
  }

  List<T> operator /(int times) {
    var list = <T>[];
    for (var i = 0; i < length; i += times) {
      list.add(this[i]);
    }
    return list;
  }
}
