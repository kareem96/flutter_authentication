import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splashscreen/splash_screen_page.dart';

class AppRoute {
  AppRoute._();

  static const String splashScreen = "splashscreen";
  static const String mainScreen = "main";

  //auth
  static const String login = "auth/login";
  static const String register = "auth/register";

  static Map<String, WidgetBuilder> getRoutes({RouteSettings? settings}) => {
    splashScreen: (_) => SplashScreenPage(),
    mainScreen: (_) {
      return BlocProvider(
          create: (_) => sl<NavDrawerCubit>(),
        child: const MainPage(),
      )
    }

  }
}