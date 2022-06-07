import 'package:flutter/material.dart';
import 'package:flutter_auth/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/di.dart';
import '../dashboard/cubit/users_cubit.dart';
import '../dashboard/dashboard_page.dart';
import '../settings/settings_page.dart';

enum Navigation {
  dashboardPage,
  settingsPage,
}

class NavDrawerCubit extends Cubit<Widget> {
  NavDrawerCubit()
      : super(
    BlocProvider(
      create: (_) => sl<UsersCubit>()..fetchUsers(UsersParams()),
      child: const DashboardPage(),
    ),
  );

  void openDrawer(Navigation event) {
    switch (event) {
      case Navigation.dashboardPage:
        emit(
          BlocProvider(
            create: (_) => sl<UsersCubit>()..fetchUsers(UsersParams()),
            child: const DashboardPage(),
          ),
        );
        break;
      case Navigation.settingsPage:
        emit(const SettingsPage());
        break;
    }
  }
}
