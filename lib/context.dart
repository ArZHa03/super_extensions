part of 'super_extensions.dart';

enum NavigateType { replace, replaceALl }

extension ContextExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.sizeOf(this);
  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (mediaQuerySize.height - ((mediaQuerySize.height / 100) * reducedBy)) / dividedBy;
  }

  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (mediaQuerySize.width - ((mediaQuerySize.width / 100) * reducedBy)) / dividedBy;
  }

  double ratio({double dividedBy = 1, double reducedByW = 0.0, double reducedByH = 0.0}) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) / widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }

  ThemeData get theme => Theme.of(this);
  bool get isDarkMode => (theme.brightness == Brightness.dark);
  Color? get iconColor => theme.iconTheme.color;
  TextTheme get textTheme => Theme.of(this).textTheme;

  EdgeInsets get mediaQueryPadding => MediaQuery.paddingOf(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaQueryViewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get mediaQueryViewInsets => MediaQuery.viewInsetsOf(this);

  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  TextScaler get textScaleFactor => MediaQuery.textScalerOf(this);

  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  bool get showNavbar => (width > 800);

  bool get isPhoneOrLess => width <= 600;
  bool get isPhoneOrWider => width >= 600;
  bool get isPhone => (mediaQueryShortestSide < 600);

  bool get isSmallTabletOrLess => width <= 600;
  bool get isSmallTabletOrWider => width >= 600;
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);
  bool get isLargeTabletOrLess => width <= 720;
  bool get isLargeTabletOrWider => width >= 720;
  bool get isTablet => isSmallTablet || isLargeTablet;

  bool get isDesktopOrLess => width <= 1200;
  bool get isDesktopOrWider => width >= 1200;
  bool get isDesktop => isDesktopOrLess;

  T responsiveValue<T>({T? watch, T? mobile, T? tablet, T? desktop}) {
    assert(watch != null || mobile != null || tablet != null || desktop != null);

    final deviceWidth = mediaQuerySize.width;
    final strictValues = [if (deviceWidth >= 1200) desktop, if (deviceWidth >= 600) tablet, if (deviceWidth >= 300) mobile, watch].whereType<T>();
    final looseValues = [watch, mobile, tablet, desktop].whereType<T>();
    return strictValues.firstOrNull ?? looseValues.first;
  }

  Future<dynamic> back({dynamic result}) => Navigator.maybePop(this, result);
  Future<dynamic> to(
    dynamic pageOrRouteName, {
    NavigateType? navigateType,
    RouteSettings? settings,
    bool? requestFocus,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
    Object? arguments,
  }) async {
    if (pageOrRouteName is Widget) {
      if (navigateType == NavigateType.replace) {
        return await Navigator.pushReplacement(
          this,
          MaterialPageRoute(
            builder: (context) => pageOrRouteName,
            settings: settings ?? RouteSettings(arguments: arguments),
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            allowSnapshotting: allowSnapshotting,
          ),
        );
      }

      if (navigateType == NavigateType.replaceALl) {
        return await Navigator.pushAndRemoveUntil(
          this,
          MaterialPageRoute(
            builder: (context) => pageOrRouteName,
            settings: settings ?? RouteSettings(arguments: arguments),
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            allowSnapshotting: allowSnapshotting,
          ),
          (route) => false,
        );
      }

      return await Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => pageOrRouteName,
          settings: settings ?? RouteSettings(arguments: arguments),
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        ),
      );
    }
    if (pageOrRouteName is String) {
      if (navigateType == NavigateType.replace) return await Navigator.pushReplacementNamed(this, pageOrRouteName, arguments: arguments);
      if (navigateType == NavigateType.replaceALl) {
        return await Navigator.pushNamedAndRemoveUntil(this, pageOrRouteName, (route) => false, arguments: arguments);
      }
      return await Navigator.pushNamed(this, pageOrRouteName, arguments: arguments);
    }
    throw Exception('Invalid page or route name');
  }
}
