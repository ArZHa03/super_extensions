# Super Extensions

Super Extensions is a Flutter package that provides various useful extensions for different data types in Dart and Flutter. This package is designed to enhance productivity by providing additional methods that are frequently used.

## Features

- Extensions for `DateTime`
- Extensions for `String`
- Extensions for `int`, `double`, and `num`
- Extensions for `List` and `Iterable`
- Extensions for `Widget`
- Extensions for `BuildContext`
- Extensions for `Color`
- Extensions for `Duration`
- Extensions for `dynamic`

## Getting Started

### Prerequisites

Ensure you have Flutter and Dart SDK installed with the appropriate versions.

### Installation

Add the following dependency to your `pubspec.yaml` and run `flutter pub get`:

```yaml
dependencies:
  super_extensions:
    git: https://github.com/ArZHa03/super_extensions.git
```

### Usage

Import the package in your Dart or Flutter file:

```dart
import 'package:super_extensions/super_extensions.dart';
```

Now you can use the extensions provided by this package. For example:

#### DateTime Extensions

```dart
void main() {
  DateTime now = DateTime.now();
  print(now.addDays(5)); // Adds 5 days
  print(now.isToday()); // Checks if the date is today
}
```

#### String Extensions

```dart
void main() {
  String text = "Hello World";
  print(text.isNum); // Checks if the string is a number
  print(text.capitalize); // Capitalizes the string
}
```

#### Widget Extensions

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container().paddingAll(16.0); // Adds padding to the widget
  }
}
```

#### BuildContext Extensions

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Screen width: ${context.width}'); // Gets the screen width
  }
}
```

#### Color Extensions

```dart
void main() {
  Color color = Colors.red;
  print(color.toHex); // Converts the color to hex
}
```

#### Duration Extensions

```dart
void main() {
  Duration duration = Duration(seconds: 30);
  print(duration.timeToString); // Converts the duration to a time string
}
```

#### Dynamic Extensions

```dart
void main() {
  dynamic value = 10;
  print(value.isInt); // Checks if the value is an integer
}
```

#### List and Iterable Extensions

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers.sum); // Calculates the sum of the list
  print(numbers.average); // Calculates the average of the list
  print(numbers.firstWhereOrNull((n) => n > 3)); // Gets the first element greater than 3
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.