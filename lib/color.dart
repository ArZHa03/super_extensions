part of 'super_extensions.dart';

extension ColorExt on Color {
  Color get invertColor => HSLColor.fromColor(this).lightness > 0.5 ? darken : lighten;
  Color get responsive => isDark ? lighten : darken;

  bool get isDark => (0.299 * r + 0.587 * g + 0.114 * b) < 0.5;
  bool get isLight => (0.299 * r + 0.587 * g + 0.114 * b) >= 0.5;

  Color get darken => HSLColor.fromColor(this).withLightness((HSLColor.fromColor(this).lightness - 0.1).clamp(0.0, 1.0)).toColor();
  Color get lighten => HSLColor.fromColor(this).withLightness((HSLColor.fromColor(this).lightness + 0.1).clamp(0.0, 1.0)).toColor();

  Color withOpacity(double opacity) => Color.fromRGBO((255 * r).toInt(), (255 * g).toInt(), (255 * b).toInt(), opacity);

  Color get opacityLowest => withAlpha(0x1A);
  Color get opacityLow => withAlpha(0x4D);
  Color get opacityHigh => withAlpha(0xB3);
  Color get opacityMedium => withAlpha(0x80);
  Color get opacityFull => withAlpha(0xFF);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${(255 * a).toInt().toRadixString(16).padLeft(2, '0')}'
      '${(255 * r).toInt().toRadixString(16).padLeft(2, '0')}'
      '${(255 * g).toInt().toRadixString(16).padLeft(2, '0')}'
      '${(255 * b).toInt().toRadixString(16).padLeft(2, '0')}';
}
