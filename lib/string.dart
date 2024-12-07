part of 'super_extensions.dart';

extension StringExt on String {
  bool get isNum => _SuperExtensions.isNum(this);
  bool get isNumericOnly => _SuperExtensions.isNumericOnly(this);
  String numericOnly({bool firstWordOnly = false}) => _SuperExtensions.numericOnly(this, firstWordOnly: firstWordOnly);
  bool get isAlphabetOnly => _SuperExtensions.isAlphabetOnly(this);
  bool get hasCapitalLetter => _SuperExtensions.hasCapitalLetter(this);
  bool get hasSmallLetter => _SuperExtensions.hasSmallLetter(this);
  bool get hasSpecialCharacters => _SuperExtensions.hasSpecialCharacters(this);
  bool get hasSpace => _SuperExtensions.hasSpace(this);
  bool get hasEmoji => _SuperExtensions.hasEmoji(this);
  bool get isLowerCase => _SuperExtensions.isLowerCase(this);
  bool get isUpperCase => _SuperExtensions.isUpperCase(this);

  bool get isBool => _SuperExtensions.isBool(this);
  bool get isBoolTrue => _SuperExtensions.isBoolTrue(this);
  bool get isBoolFalse => _SuperExtensions.isBoolFalse(this);

  bool get isVectorFileName => _SuperExtensions.isVector(this);
  bool get isImageFileName => _SuperExtensions.isImage(this);
  bool get isAudioFileName => _SuperExtensions.isAudio(this);
  bool get isVideoFileName => _SuperExtensions.isVideo(this);
  bool get isTxtFileName => _SuperExtensions.isTxt(this);
  bool get isDocumentFileName => _SuperExtensions.isWord(this);
  bool get isExcelFileName => _SuperExtensions.isExcel(this);
  bool get isPPTFileName => _SuperExtensions.isPPT(this);
  bool get isAPKFileName => _SuperExtensions.isAPK(this);
  bool get isPDFFileName => _SuperExtensions.isPDF(this);
  bool get isHTMLFileName => _SuperExtensions.isHTML(this);
  bool get isChmFileName => _SuperExtensions.isChm(this);

  bool get isURL => _SuperExtensions.isURL(this);
  bool get isEmail => _SuperExtensions.isEmail(this);
  bool get isUsername => _SuperExtensions.isUsername(this);
  bool get isPhoneNumber => _SuperExtensions.isPhoneNumber(this);
  bool get isDateTime => _SuperExtensions.isDateTime(this);
  bool get isMD5 => _SuperExtensions.isMD5(this);
  bool get isSHA1 => _SuperExtensions.isSHA1(this);
  bool get isSHA256 => _SuperExtensions.isSHA256(this);
  bool get isSHA512 => _SuperExtensions.isSHA512(this);
  bool get isSSN => _SuperExtensions.isSSN(this);
  bool get isBinary => _SuperExtensions.isBinary(this);
  bool get isIPv4 => _SuperExtensions.isIPv4(this);
  bool get isIPv6 => _SuperExtensions.isIPv6(this);
  bool get isHexadecimal => _SuperExtensions.isHexadecimal(this);
  bool get isPalindrome => _SuperExtensions.isPalindrome(this);
  bool get isPassport => _SuperExtensions.isPassport(this);
  bool get isCurrency => _SuperExtensions.isCurrency(this);
  bool get isCpf => _SuperExtensions.isCpf(this);
  bool get isCnpj => _SuperExtensions.isCnpj(this);

  bool isCaseInsensitiveContains(String b) => _SuperExtensions.isCaseInsensitiveContains(this, b);
  bool isCaseInsensitiveContainsAny(String b) => _SuperExtensions.isCaseInsensitiveContainsAny(this, b);

  String get capitalize => _SuperExtensions.capitalize(this);
  String get capitalizeFirst => _SuperExtensions.capitalizeFirst(this);
  String get removeAllWhitespace => _SuperExtensions.removeAllWhitespace(this);

  String? get camelCase => _SuperExtensions.camelCase(this);
  String? get paramCase => _SuperExtensions.paramCase(this);

  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return _SuperExtensions.createPath(path, segments);
  }

  String capitalizeAllWordsFirstLetter() => _SuperExtensions.capitalizeAllWordsFirstLetter(this);
}
