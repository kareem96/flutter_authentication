import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/presentation/pages/app_route.dart';
import 'package:flutter_auth/presentation/pages/main/main.dart';
import 'package:flutter_auth/utils/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di/di.dart';
import 'presentation/resources/styles.dart';

Future<void> main() async {
  await serviceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light));
  runZonedGuarded(
      () => SystemChrome.setPreferredOrientations(
            [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ],
          ).then((_) async {
            SharedPreferences.getInstance().then((value) {
              initPrefManager(value);
              runApp(const MyApp());
            });
          }),
      (error, stack) async {});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: OKToast(
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, __) => BlocBuilder<SettingsCubit, int>(
                builder: (_, __) => MaterialApp(
                  localizationsDelegates: const[
                    Strings.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  builder: (BuildContext context, Widget? child){
                    final MediaQueryData data = MediaQuery.of(context);
                    return MediaQuery(
                        data: data.copyWith(
                          textScaleFactor: 1,
                          alwaysUse24HourFormat: true
                        ),
                        child: child!
                    );
                  },
                  title: Constants.get.appName,
                  theme: themeLight,
                  darkTheme: themeDark,
                  locale: Locale(sl<PrefManager>().locale),
                  supportedLocales: L10n.all,
                  themeMode: sl<PrefManager>().theme == describeEnum(ActiveTheme.light) ? ThemeMode.light :
                      sl<PrefManager>().theme == describeEnum(ActiveTheme.dark) ? ThemeMode.dark : ThemeMode.system,
                  onGenerateRoute: (RouteSettings settings){
                    final routes = AppRoute.getRoutes(settings: settings);
                    final WidgetBuilder? builder = routes[settings.name];
                    return MaterialPageRoute(
                      builder: (context) => builder!(context),
                      settings: settings
                    );
                  },
                  initialRoute: AppRoute.splashScreen,
                )
            )
        ),
      ),
    );
  }
}
