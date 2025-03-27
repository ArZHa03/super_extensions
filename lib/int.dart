 part of 'super_extensions.dart';

extension IntExt on int {
  Duration get seconds => Duration(seconds: this);
  Duration get days => Duration(days: this);
  Duration get hours => Duration(hours: this);
  Duration get minutes => Duration(minutes: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get microseconds => Duration(microseconds: this);
  Duration get ms => milliseconds;

  bool get isBool => this == 0 || this == 1;
  bool get isTrue => this == 1;
  bool get isFalse => this == 0;

  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;
  int get nextEven => isEven ? this + 2 : this + 1;
  int get nextOdd => isOdd ? this + 2 : this + 1;
  int get previousEven => isEven ? this - 2 : this - 1;
  int get previousOdd => isOdd ? this - 2 : this - 1;

  bool get isPositive => this > 0;
  bool get isNegative => this < 0;

  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= sqrt; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }

  bool get isFactorial {
    if (this < 0) return false;
    for (int i = 1; i <= this; i++) {
      if (this == i.factorial) return true;
    }
    return false;
  }

  bool get isFibonacci {
    if (this < 0) return false;
    int a = 0, b = 1;
    while (a < this) {
      int c = a + b;
      a = b;
      b = c;
    }
    return a == this;
  }

  bool get isSquare => sqrt * sqrt == this;

  int get factorial {
    if (this < 0) throw Exception('Factorial: Number must be non-negative');
    return this <= 1 ? 1 : this * (this - 1).factorial;
  }

  int get nextPrime {
    if (this < 2) return 2;
    int n = this + 1;
    while (true) {
      if (n.isPrime) return n;
      n++;
    }
  }

  int get previousPrime {
    if (this < 2) return 2;
    int n = this - 1;
    while (true) {
      if (n.isPrime) return n;
      n--;
    }
  }

  int get nextFibonacci {
    if (this < 0) return 0;
    int a = 0, b = 1;
    while (a < this) {
      int c = a + b;
      a = b;
      b = c;
    }
    return b;
  }

  int get previousFibonacci {
    if (this < 0) return 0;
    int a = 0, b = 1;
    while (a < this) {
      int c = a + b;
      a = b;
      b = c;
    }
    return a;
  }

  int get sqrt => math.sqrt(toDouble()).toInt();
  int get round => math.sqrt(this).round();
  int get ceil => math.sqrt(this).ceil();
  int get floor => math.sqrt(this).floor();
  int get truncate => math.sqrt(this).truncate();
  int get toPositive => isNegative ? -this : this;
  int get toNegative => isPositive ? -this : this;

  bool get isZero => this == 0;
  bool get isNonZero => this != 0;

  bool get isMultipleOfTwo => this % 2 == 0;
  bool get isMultipleOfThree => this % 3 == 0;
  bool get isMultipleOfFive => this % 5 == 0;
  bool get isMultipleOfSeven => this % 7 == 0;
  bool get isMultipleOfEleven => this % 11 == 0;
  bool get isMultipleOfThirteen => this % 13 == 0;
  bool get isMultipleOfSeventeen => this % 17 == 0;
  bool get isMultipleOfNineteen => this % 19 == 0;
  bool get isMultipleOfTwentyThree => this % 23 == 0;
  bool get isMultipleOfTwentyNine => this % 29 == 0;
  bool get isMultipleOfThirtyOne => this % 31 == 0;
  bool get isMultipleOfThirtySeven => this % 37 == 0;
  bool get isMultipleOfFortyOne => this % 41 == 0;
  bool get isMultipleOfFortyThree => this % 43 == 0;
  bool get isMultipleOfFortySeven => this % 47 == 0;
  bool get isMultipleOfFiftyThree => this % 53 == 0;
  bool get isMultipleOfFiftyNine => this % 59 == 0;
  bool get isMultipleOfSixtyOne => this % 61 == 0;
}
