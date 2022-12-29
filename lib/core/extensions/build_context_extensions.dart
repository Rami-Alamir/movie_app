import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => Theme.of(this).primaryColor;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get backgroundColor => Theme.of(this).backgroundColor;
}

extension NavigatorExtension on BuildContext {
  Future pushNamed({required String routName, dynamic arguments}) {
    return Navigator.pushNamed(this, routName, arguments: arguments);
  }

  Future pushReplacementNamed({required String routName}) {
    return Navigator.pushReplacementNamed(this, routName);
  }

  void pop() {
    return Navigator.pop(this);
  }
}
