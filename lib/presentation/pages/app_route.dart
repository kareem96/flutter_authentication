import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/di/di.dart';
import 'package:flutter_auth/presentation/pages/main/create/create_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/cubit/cubit.dart';
import 'auth/login_page.dart';
import 'auth/register_page.dart';
import 'main/create/cubit/create_cubit.dart';
import 'main/cubit/nav_drawer_cubit.dart';
import 'main/main_page.dart';
import 'splashscreen/splash_screen_page.dart';

class AppRoute {
  AppRoute._();

  static const String splashScreen = "splashscreen";
  static const String mainScreen = "main";

  //auth
  static const String login = "auth/login";
  static const String register = "auth/register";

  //
  static const String create = "main/create";

  static Map<String, WidgetBuilder> getRoutes({RouteSettings? settings}) => {
        splashScreen: (_) => const SplashScreenPage(),
        mainScreen: (_) {
          return BlocProvider(
            create: (_) => sl<NavDrawerCubit>(),
            child: const MainPage(),
          );
        },
        login: (_) => BlocProvider(
              create: (_) => sl<LoginCubit>(),
              child: const LoginPage(),
            ),
        register: (_) => BlocProvider(
              create: (_) => sl<RegisterCubit>(),
              child: const RegisterPage(),
            ),
        create: (_) => BlocProvider(
              create: (_) => sl<CreateCubit>(),
              child: const CreatePage(),
            )
      };
}
