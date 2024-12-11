part of 'super_extensions.dart';

extension ColorExt on Color {
  Color get invertColor {
    final hsl = HSLColor.fromColor(this);
    return hsl.lightness > 0.5 ? darken : lighten;
  }

  Color get responsive => isDark ? lighten : darken;

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

  Color get opacityLowest => withAlpha(0x1A);
  Color get opacityLow => withAlpha(0x4D);
  Color get opacityHigh => withAlpha(0xB3);
  Color get opacityMedium => withAlpha(0x80);
  Color get opacityFull => withAlpha(0xFF);

  String get toHex {
    final buffer = StringBuffer();
    buffer.write('#');
    buffer.write(red.toRadixString(16).padLeft(2, '0'));
    buffer.write(green.toRadixString(16).padLeft(2, '0'));
    buffer.write(blue.toRadixString(16).padLeft(2, '0'));
    return buffer.toString();
  }
}
