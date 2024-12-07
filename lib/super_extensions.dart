import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math' as math;

import 'package:flutter/material.dart';

part 'color.dart';
part 'context.dart';
part 'date_time.dart';
part 'double.dart';
part 'duration.dart';
part 'dynamic.dart';
part 'int.dart';
part 'list.dart';
part 'iterable.dart';
part 'num.dart';
part 'string.dart';
part 'widget.dart';

class _SuperExtensions {
  static bool? _isEmpty(dynamic value) {
    if (value is String) return value.toString().trim().isEmpty;
    if (value is Iterable || value is Map) return value.isEmpty as bool?;
    return false;
  }

  static bool isNull(dynamic value) => value == null;
  static bool? isNullOrBlank(dynamic value) {
    if (isNull(value)) return true;
    return _isEmpty(value);
  }

  static bool? isBlank(dynamic value) => _isEmpty(value);

  static bool isNum(String value) {
    if (isNull(value)) return false;
    return num.tryParse(value) is num;
  }

  static bool isNumericOnly(String s) => hasMatch(s, r'^\d+$');
  static bool isAlphabetOnly(String s) => hasMatch(s, r'^[a-zA-Z]+$');
  static bool hasCapitalLetter(String s) => hasMatch(s, r'[A-Z]');
  static bool hasSmallLetter(String s) => hasMatch(s, r'[a-z]');
  static final RegExp _special = RegExp(r"(?=.*[!#$%&'()*+,-./:;<=>?@[\\\]^_`{|}~])");
  static final RegExp _specialAdditional = RegExp(r'"');
  static bool hasSpecialCharacters(String s) => s.contains(_special) || s.contains(_specialAdditional);
  static final RegExp _emoticon = RegExp(
      r'[\u00A9\u00AE\u203C\u2049\u2122\u2139\u2194-\u2199\u21A9-\u21AA\u231A-\u231B\u2328\u23CF\u23E9-\u23F3\u23F8-\u23FA\u24C2\u25AA-\u25AB\u25B6\u25C0\u25FB-\u25FE\u2600-\u2604\u260E\u2611\u2614-\u2615\u2618\u261D\u2620\u2622-\u2623\u2626\u262A\u262E-\u262F\u2638-\u263A\u2640\u2642\u2648-\u2653\u2660\u2663\u2665-\u2666\u2668\u267B\u267F\u2692-\u2697\u2699\u269B-\u269C\u26A0-\u26A1\u26AA-\u26AB\u26B0-\u26B1\u26BD-\u26BE\u26C4-\u26C5\u26C8\u26CE-\u26CF\u26D1\u26D3-\u26D4\u26E9-\u26EA\u26F0-\u26F5\u26F7-\u26FA\u26FD\u2702\u2705\u2708-\u270D\u270F\u2712\u2714\u2716\u271D\u2721\u2728\u2733-\u2734\u2744\u2747\u274C\u274E\u2753-\u2755\u2757\u2763-\u2764\u2795-\u2797\u27A1\u27B0\u27BF\u2934-\u2935\u2B05-\u2B07\u2B1B-\u2B1C\u2B50\u2B55\u3030\u303D\u3297\u3299]|(?:\uD83C[\uDC04\uDCCF\uDD70-\uDD71\uDD7E-\uDD7F\uDD8E\uDD91-\uDD9A\uDDE6-\uDDFF\uDE01-\uDE02\uDE1A\uDE2F\uDE32-\uDE3A\uDE50-\uDE51\uDF00-\uDF21\uDF24-\uDF93\uDF96-\uDF97\uDF99-\uDF9B\uDF9E-\uDFF0\uDFF3-\uDFF5\uDFF7-\uDFFF]|\uD83D[\uDC00-\uDCFD\uDCFF-\uDD3D\uDD49-\uDD4E\uDD50-\uDD67\uDD6F-\uDD70\uDD73-\uDD7A\uDD87\uDD8A-\uDD8D\uDD90\uDD95-\uDD96\uDDA4-\uDDA5\uDDA8\uDDB1-\uDDB2\uDDBC\uDDC2-\uDDC4\uDDD1-\uDDD3\uDDDC-\uDDDE\uDDE1\uDDE3\uDDE8\uDDEF\uDDF3\uDDFA-\uDE4F\uDE80-\uDEC5\uDECB-\uDED2\uDEE0-\uDEE5\uDEE9\uDEEB-\uDEEC\uDEF0\uDEF3-\uDEF6]|\uD83E[\uDD10-\uDD1E\uDD20-\uDD27\uDD30\uDD33-\uDD3A\uDD3C-\uDD3E\uDD40-\uDD45\uDD47-\uDD4B\uDD50-\uDD5E\uDD80-\uDD91\uDDC0])');
  static final RegExp _emoji = RegExp(r'[\u{1F600}-\u{1F64F}]', unicode: true);
  static bool hasEmoji(String s) => s.contains(_emoticon) || s.contains(_emoji);
  static bool hasSpace(String s) => hasMatch(s, r'\s');
  static bool isLowerCase(String s) => hasMatch(s, r'^[a-z]+$');
  static bool isUpperCase(String s) => hasMatch(s, r'^[A-Z]+$');

  static bool isBool(String value) {
    if (isNull(value)) return false;
    return (value == 'true' || value == 'false');
  }

  static bool isBoolTrue(String value) {
    if (isNull(value)) return false;
    return value == 'true';
  }

  static bool isBoolFalse(String value) {
    if (isNull(value)) return false;
    return value == 'false';
  }

  static bool isVideo(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  static bool isImage(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".jpg") ||
        ext.endsWith(".jpeg") ||
        ext.endsWith(".png") ||
        ext.endsWith(".gif") ||
        ext.endsWith(".bmp");
  }

  static bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  static bool isPPT(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".ppt") || ext.endsWith(".pptx");
  }

  static bool isWord(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".doc") || ext.endsWith(".docx");
  }

  static bool isExcel(String filePath) {
    final ext = filePath.toLowerCase();
    return ext.endsWith(".xls") || ext.endsWith(".xlsx");
  }

  static bool isAPK(String filePath) => filePath.toLowerCase().endsWith(".apk");
  static bool isPDF(String filePath) => filePath.toLowerCase().endsWith(".pdf");
  static bool isTxt(String filePath) => filePath.toLowerCase().endsWith(".txt");
  static bool isChm(String filePath) => filePath.toLowerCase().endsWith(".chm");
  static bool isVector(String filePath) => filePath.toLowerCase().endsWith(".svg");

  static bool isHTML(String filePath) => filePath.toLowerCase().endsWith(".html");
  static bool isUsername(String s) => hasMatch(s, r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$');
  static bool isURL(String s) => hasMatch(s,
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");
  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  }

  static bool isDateTime(String s) => hasMatch(s, r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$');
  static bool isMD5(String s) => hasMatch(s, r'^[a-f0-9]{32}$');
  static bool isSHA1(String s) => hasMatch(s, r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})');
  static bool isSHA256(String s) => hasMatch(s, r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}');
  static bool isSHA512(String s) => hasMatch(s, r'([A-Fa-f0-9]{2}\:){63}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{128}');
  static bool isSSN(String s) => hasMatch(s, r'^(?!0{3}|6{3}|9[0-9]{2})[0-9]{3}-?(?!0{2})[0-9]{2}-?(?!0{4})[0-9]{4}$');
  static bool isBinary(String s) => hasMatch(s, r'^[0-1]+$');
  static bool isIPv4(String s) => hasMatch(s, r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$');
  static bool isIPv6(String s) => hasMatch(s,
      r'^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$');

  static bool isHexadecimal(String s) => hasMatch(s, r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  static bool isPalindrome(String string) {
    final cleanString = string.toLowerCase().replaceAll(RegExp(r"\s+"), '').replaceAll(RegExp(r"[^0-9a-zA-Z]+"), "");

    for (var i = 0; i < cleanString.length; i++) {
      if (cleanString[i] != cleanString[cleanString.length - i - 1]) return false;
    }
    return true;
  }

  static bool isOneAKind(dynamic value) {
    if ((value is String || value is List) && !isNullOrBlank(value)!) {
      final first = value[0];
      final len = value.length as num;

      for (var i = 0; i < len; i++) {
        if (value[i] != first) return false;
      }

      return true;
    }

    if (value is int) {
      final stringValue = value.toString();
      final first = stringValue[0];

      for (var i = 0; i < stringValue.length; i++) {
        if (stringValue[i] != first) return false;
      }
      return true;
    }
    return false;
  }

  static bool isPassport(String s) => hasMatch(s, r'^(?!^0+$)[a-zA-Z0-9]{6,9}$');

  static bool isCurrency(String s) => hasMatch(s,
      r'^(S?\$|\₩|Rp|\¥|\€|\₹|\₽|fr|R\$|R)?[ ]?[-]?([0-9]{1,3}[,.]([0-9]{3}[,.])*[0-9]{3}|[0-9]+)([,.][0-9]{1,2})?( ?(USD?|AUD|NZD|CAD|CHF|GBP|CNY|EUR|JPY|IDR|MXN|NOK|KRW|TRY|INR|RUB|BRL|ZAR|SGD|MYR))?$');

  static bool isCaseInsensitiveContains(String a, String b) => a.toLowerCase().contains(b.toLowerCase());

  static bool isCaseInsensitiveContainsAny(String a, String b) {
    final lowA = a.toLowerCase();
    final lowB = b.toLowerCase();

    return lowA.contains(lowB) || lowB.contains(lowA);
  }

  static bool isLowerThan(num a, num b) => a < b;

  static bool isGreaterThan(num a, num b) => a > b;

  static bool isEqual(num a, num b) => a == b;

  static bool isCnpj(String cnpj) {
    final numbers = cnpj.replaceAll(RegExp(r'[^0-9]'), '');

    if (numbers.length != 14) return false;

    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) return false;

    final digits = numbers.split('').map(int.parse).toList();

    int calcDv1 = 0;
    int j = 0;
    for (var i in Iterable<int>.generate(12, (i) => i < 4 ? 5 - i : 13 - i)) {
      calcDv1 += digits[j++] * i;
    }
    calcDv1 %= 11;
    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;
    if (digits[12] != dv1) return false;

    int calcDv2 = 0;
    j = 0;
    for (var i in Iterable<int>.generate(13, (i) => i < 5 ? 6 - i : 14 - i)) {
      calcDv2 += digits[j++] * i;
    }
    calcDv2 %= 11;
    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    if (digits[13] != dv2) return false;
    return true;
  }

  static bool isCpf(String cpf) {
    final numbers = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (numbers.length != 11) return false;
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) return false;

    final digits = numbers.split('').map(int.parse).toList();

    int calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digits[10 - i] * i;
    }
    calcDv1 %= 11;

    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;
    if (digits[9] != dv1) return false;

    int calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digits[11 - i] * i;
    }
    calcDv2 %= 11;

    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;
    if (digits[10] != dv2) return false;
    return true;
  }

  static String capitalize(String value) {
    if (isBlank(value)!) return value;
    return value.split(' ').map(capitalizeFirst).join(' ');
  }

  static String capitalizeFirst(String s) {
    if (isBlank(s)!) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  static String removeAllWhitespace(String value) => value.replaceAll(' ', '');

  static String? camelCase(String value) {
    if (isNullOrBlank(value)!) {
      return null;
    }

    final separatedWords = value.split(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-\s_]+'));
    var newString = '';

    for (final word in separatedWords) {
      newString += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }

    return newString[0].toLowerCase() + newString.substring(1);
  }

  static final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
  static final _symbolSet = {' ', '.', '/', '_', '\\', '-'};
  static List<String> _groupIntoWords(String text) {
    var sb = StringBuffer();
    var words = <String>[];
    var isAllCaps = text.toUpperCase() == text;

    for (var i = 0; i < text.length; i++) {
      var char = text[i];
      var nextChar = i + 1 == text.length ? null : text[i + 1];
      if (_symbolSet.contains(char)) {
        continue;
      }
      sb.write(char);
      var isEndOfWord =
          nextChar == null || (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) || _symbolSet.contains(nextChar);
      if (isEndOfWord) {
        words.add('$sb');
        sb.clear();
      }
    }
    return words;
  }

  static String? snakeCase(String? text, {String separator = '_'}) {
    if (isNullOrBlank(text)!) {
      return null;
    }
    return _groupIntoWords(text!).map((word) => word.toLowerCase()).join(separator);
  }

  static String? paramCase(String? text) => snakeCase(text, separator: '-');

  static String numericOnly(String s, {bool firstWordOnly = false}) {
    var numericOnlyStr = '';

    for (var i = 0; i < s.length; i++) {
      if (isNumericOnly(s[i])) {
        numericOnlyStr += s[i];
      }
      if (firstWordOnly && numericOnlyStr.isNotEmpty && s[i] == " ") {
        break;
      }
    }

    return numericOnlyStr;
  }

  static String capitalizeAllWordsFirstLetter(String s) {
    String lowerCasedString = s.toLowerCase();
    String stringWithoutExtraSpaces = lowerCasedString.trim();

    if (stringWithoutExtraSpaces.isEmpty) {
      return "";
    }
    if (stringWithoutExtraSpaces.length == 1) {
      return stringWithoutExtraSpaces.toUpperCase();
    }

    List<String> stringWordsList = stringWithoutExtraSpaces.split(" ");
    List<String> capitalizedWordsFirstLetter = stringWordsList
        .map(
          (word) {
            if (word.trim().isEmpty) return "";
            return word.trim();
          },
        )
        .where(
          (word) => word != "",
        )
        .map(
          (word) {
            if (word.startsWith(RegExp(r'[\n\t\r]'))) {
              return word;
            }
            return word[0].toUpperCase() + word.substring(1).toLowerCase();
          },
        )
        .toList();
    String finalResult = capitalizedWordsFirstLetter.join(" ");
    return finalResult;
  }

  static bool hasMatch(String? value, String pattern) => (value == null) ? false : RegExp(pattern).hasMatch(value);

  static String createPath(String path, [Iterable? segments]) {
    if (segments == null || segments.isEmpty) return path;

    final list = segments.map((e) => '/$e');
    return path + list.join();
  }

  static void printFunction(String prefix, dynamic value, String info, {bool isError = false}) =>
      developer.log('$prefix $value $info'.trim(), error: isError);
}
