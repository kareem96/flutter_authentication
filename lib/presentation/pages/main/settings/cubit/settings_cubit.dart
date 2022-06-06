import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<int> {
  SettingsCubit() : super(0);

  void reloadWidget() {
    emit(Random().nextInt(1000));
  }
}
