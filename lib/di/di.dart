import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/domain/domain.dart';
import 'package:flutter_auth/presentation/pages/auth/cubit/cubit.dart';
import 'package:flutter_auth/presentation/pages/main/cubit/nav_drawer_cubit.dart';
import 'package:flutter_auth/presentation/pages/main/dashboard/cubit/users_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({bool isUnitTest = false}) async {
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance().then((value) {
      initPrefManager(value);
    });
    sl.registerSingleton<DioClient>(DioClient(isUnitTest: true));
    dataSource();
    repositories();
    useCase();
    cubit();
  }else{
    sl.registerSingleton<DioClient>(DioClient());
    dataSource();
    repositories();
    useCase();
    cubit();
  }
}

void cubit() {
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => NavDrawerCubit());
  sl.registerFactory(() => UsersCubit(sl()));
}

void useCase() {
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));
}

void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}

void dataSource() {
  sl.registerLazySingleton<AuthRemoteDatasource>(() => AuthRemoteDatasourceImpl(sl()));
}

void initPrefManager(SharedPreferences _initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(_initPrefManager));
}