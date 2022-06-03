import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext{
  bool isMobile(){
    final shortestSide = MediaQuery.of(this).size.shortestSide;
    return shortestSide < 600;
  }
  dynamic back([dynamic result]) => Navigator.pop(this, result);
  Future<dynamic> goTo(String routeName, {Object? args}) =>
      Navigator.pushNamed(this, routeName, arguments: args);

  Future<dynamic> goToReplace(String routeName, {Object? args}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: args);

  Future<dynamic> goToClearStack(String route)
}