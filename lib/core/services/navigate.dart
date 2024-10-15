import 'package:flutter/material.dart';

class Navigate {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static BuildContext? get context => navigatorKey.currentContext;

  static Future<T?>? push<T>(
      {required Widget page, PageRouteBuilder<T>? transition}) {
    if (transition == null) {
      return navigatorKey.currentState?.push(_materialPageRoute(page));
    } else {
      return navigatorKey.currentState?.push(transition);
    }
  }

  static Future<T?>? pushNamed<T>({required String root, Object? arg}) {
    return navigatorKey.currentState?.pushNamed(root, arguments: arg);
  }

  static Future<T?>? pushNamedAndRemoveAll<T>(
      {required String root, Object? arg}) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(root, (route) => false, arguments: arg);
  }

  static Future<T?>? pushAndRemoveAll<T>(
      {required Widget page, PageRouteBuilder<T>? transition}) {
    if (transition == null) {
      return navigatorKey.currentState
          ?.pushAndRemoveUntil(_materialPageRoute(page), (route) => false);
    } else {
      return navigatorKey.currentState
          ?.pushAndRemoveUntil(transition, (route) => false);
    }
  }

  static void pop({dynamic result}) {
    navigatorKey.currentState?.pop(result);
  }

  static MaterialPageRoute<T> _materialPageRoute<T>(Widget page) {
    return MaterialPageRoute<T>(
        builder: (_) => page, settings: RouteSettings(name: page.toString()));
  }

  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  static void popUntilPredicate(RoutePredicate predicate) {
    navigatorKey.currentState?.popUntil(predicate);
  }
}
