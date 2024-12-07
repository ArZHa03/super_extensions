part of 'super_extensions.dart';

extension IterableExt<T> on Iterable<T> {
  T? get firstOrNull {
    var iterator = this.iterator;
    if (iterator.moveNext()) return iterator.current;
    return null;
  }

  Iterable<TRes> mapMany<TRes>(Iterable<TRes>? Function(T item) selector) sync* {
    for (var item in this) {
      final res = selector(item);
      if (res != null) yield* res;
    }
  }

  Iterable<T> whereNotNull() sync* {
    for (var item in this) {
      if (item != null) yield item;
    }
  }

  Iterable<T> distinctBy<TProperty>(TProperty Function(T) selector) sync* {
    var set = <TProperty>{};
    for (var item in this) {
      var property = selector(item);
      if (set.add(property)) yield item;
    }
  }

  Iterable<T> distinctByString(String Function(T) selector) => distinctBy(selector);
  Iterable<T> distinctByInt(int Function(T) selector) => distinctBy(selector);
  Iterable<T> distinctByDouble(double Function(T) selector) => distinctBy(selector);
  Iterable<T> distinctByBool(bool Function(T) selector) => distinctBy(selector);
  Iterable<T> distinctByDateTime(DateTime Function(T) selector) => distinctBy(selector);
  Iterable<T> distinctByIgnoreCase(String Function(T) selector) sync* {
    var set = <String>{};
    for (var item in this) {
      var property = selector(item).toLowerCase();
      if (set.add(property)) yield item;
    }
  }

  Iterable<T> distinctByIgnoreCaseString(String Function(T) selector) => distinctByIgnoreCase(selector);

  Iterable<T> distinct() sync* {
    var set = <T>{};

    for (var item in this) {
      if (set.add(item)) {
        yield item;
      }
    }
  }

  Iterable<List<T>> chunk(int size) sync* {
    var iterator = this.iterator;
    while (iterator.moveNext()) {
      var chunk = <T>[];
      for (var i = 0; i < size; i++) {
        if (iterator.current == null) break;
        chunk.add(iterator.current);
        if (!iterator.moveNext()) break;
      }
      yield chunk;
    }
  }

  Iterable<T> takeLast(int count) {
    var length = this.length;
    if (length <= count) return this;
    return skip(length - count);
  }

  Iterable<T> takeLastWhile(bool Function(T) predicate) {
    var list = toList();
    var length = list.length;
    for (var i = length - 1; i >= 0; i--) {
      if (!predicate(list[i])) return list.skip(i + 1);
    }
    return list;
  }

  Iterable<T> skipLast(int count) {
    var length = this.length;
    if (length <= count) return [];
    return take(length - count);
  }

  Iterable<T> skipLastWhile(bool Function(T) predicate) {
    var list = toList();
    var length = list.length;
    for (var i = length - 1; i >= 0; i--) {
      if (!predicate(list[i])) return list.take(i + 1);
    }
    return [];
  }

  Map<TKey, List<T>> groupBy<TKey>(TKey Function(T) keySelector) {
    var map = <TKey, List<T>>{};
    for (var item in this) {
      var key = keySelector(item);
      if (!map.containsKey(key)) map[key] = <T>[];
      map[key]!.add(item);
    }
    return map;
  }

  Map<TKey, List<T>> groupByIgnoreCase<TKey>(TKey Function(T) keySelector) {
    var map = <TKey, List<T>>{};
    for (var item in this) {
      var key = keySelector(item);
      if (!map.containsKey(key)) map[key] = <T>[];
      map[key]!.add(item);
    }
    return map;
  }

  Map<TKey, T> toMap<TKey>(TKey Function(T) keySelector) {
    var map = <TKey, T>{};
    for (var item in this) {
      var key = keySelector(item);
      map[key] = item;
    }
    return map;
  }

  Map<TKey, T> toMapIgnoreCase<TKey>(TKey Function(T) keySelector) {
    var map = <TKey, T>{};
    for (var item in this) {
      var key = keySelector(item);
      map[key] = item;
    }
    return map;
  }

  T? maxBy<TProperty extends Comparable>(TProperty Function(T) selector) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var max = iterator.current;
    var maxValue = selector(max);
    while (iterator.moveNext()) {
      var value = selector(iterator.current);
      if (value.compareTo(maxValue) > 0) {
        max = iterator.current;
        maxValue = value;
      }
    }
    return max;
  }

  T? minBy<TProperty extends Comparable>(TProperty Function(T) selector) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var min = iterator.current;
    var minValue = selector(min);
    while (iterator.moveNext()) {
      var value = selector(iterator.current);
      if (value.compareTo(minValue) < 0) {
        min = iterator.current;
        minValue = value;
      }
    }
    return min;
  }

  T? maxByOrNull<TProperty extends Comparable>(TProperty Function(T) selector) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var max = iterator.current;
    var maxValue = selector(max);
    while (iterator.moveNext()) {
      var value = selector(iterator.current);
      if (value.compareTo(maxValue) > 0) {
        max = iterator.current;
        maxValue = value;
      }
    }
    return max;
  }

  T? minByOrNull<TProperty extends Comparable>(TProperty Function(T) selector) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var min = iterator.current;
    var minValue = selector(min);
    while (iterator.moveNext()) {
      var value = selector(iterator.current);
      if (value.compareTo(minValue) < 0) {
        min = iterator.current;
        minValue = value;
      }
    }
    return min;
  }

  T? maxWith(Comparator<T> comparator) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var max = iterator.current;
    while (iterator.moveNext()) {
      if (comparator(iterator.current, max) > 0) max = iterator.current;
    }
    return max;
  }

  T? minWith(Comparator<T> comparator) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var min = iterator.current;
    while (iterator.moveNext()) {
      if (comparator(iterator.current, min) < 0) min = iterator.current;
    }
    return min;
  }

  T? maxWithOrNull(Comparator<T> comparator) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var max = iterator.current;
    while (iterator.moveNext()) {
      if (comparator(iterator.current, max) > 0) max = iterator.current;
    }
    return max;
  }

  T? minWithOrNull(Comparator<T> comparator) {
    var iterator = this.iterator;
    if (!iterator.moveNext()) return null;
    var min = iterator.current;
    while (iterator.moveNext()) {
      if (comparator(iterator.current, min) < 0) min = iterator.current;
    }
    return min;
  }

  Iterable<T> flatten() sync* {
    for (var item in this) {
      if (item is Iterable<T>) {
        yield* item.flatten();
      } else {
        yield item;
      }
    }
  }

  Iterable<T> flattenDeep([int depth = 1]) sync* {
    for (var item in this) {
      if (item is Iterable<T> && depth > 0) {
        yield* item.flattenDeep(depth - 1);
      } else {
        yield item;
      }
    }
  }
}
