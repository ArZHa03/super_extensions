part of 'super_extensions.dart';

extension ColorExt on Color {
  Color get invertColor {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithThreshold {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithBlackAndWhite {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithBlackAndWhiteThreshold {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithWhiteAndBlack {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithWhiteAndBlackThreshold {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithThresholdBlackAndWhite {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  Color get invertColorWithThresholdWhiteAndBlack {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? Colors.black : Colors.white;
  }

  bool get isDark {
    final luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    return luminance < 0.5;
  }

  bool get isLight {
    final luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    return luminance >= 0.5;
  }

  Color get darken =>
      HSLColor.fromColor(this).withLightness((HSLColor.fromColor(this).lightness - 0.1).clamp(0.0, 1.0)).toColor();
  Color get lighten =>
      HSLColor.fromColor(this).withLightness((HSLColor.fromColor(this).lightness + 0.1).clamp(0.0, 1.0)).toColor();

  Color withOpacity(double opacity) => Color.fromRGBO(red, green, blue, opacity);

  Color get withOpacityLowest => withAlpha(0x1A);
  Color get withOpacityLow => withAlpha(0x4D);
  Color get withOpacityHigh => withAlpha(0xB3);
  Color get withOpacityMedium => withAlpha(0x80);
  Color get withOpacityFull => withAlpha(0xFF);

  Color get withOpacityLowestBlack => Colors.black.withOpacity(0.1);
  Color get withOpacityLowestWhite => Colors.white.withOpacity(0.1);

  Color get withOpacityLowBlack => Colors.black.withOpacity(0.3);
  Color get withOpacityLowWhite => Colors.white.withOpacity(0.3);

  Color get withOpacityLowestBlackOrWhite => isDark ? withOpacityLowestWhite : withOpacityLowestBlack;

  Color get withOpacityMediumBlack => Colors.black.withOpacity(0.5);
  Color get withOpacityMediumWhite => Colors.white.withOpacity(0.5);

  Color get withOpacityMediumBlackOrWhite => isDark ? withOpacityMediumWhite : withOpacityMediumBlack;

  Color get withOpacityHighBlack => Colors.black.withOpacity(0.7);
  Color get withOpacityHighWhite => Colors.white.withOpacity(0.7);

  Color get withOpacityHighBlackOrWhite => isDark ? withOpacityHighWhite : withOpacityHighBlack;

  String get toHex {
    final buffer = StringBuffer();
    buffer.write('#');
    buffer.write(red.toRadixString(16).padLeft(2, '0'));
    buffer.write(green.toRadixString(16).padLeft(2, '0'));
    buffer.write(blue.toRadixString(16).padLeft(2, '0'));
    return buffer.toString();
  }
}