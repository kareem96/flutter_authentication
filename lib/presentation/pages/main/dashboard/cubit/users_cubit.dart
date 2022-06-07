import 'package:equatable/equatable.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/domain.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUser) : super(const UsersState());
  final GetUsers _getUser;

  Future<void> fetchUsers(UsersParams userParams) async {
    /// Only show loading in 1 page
    await _fetchData(userParams);
  }

  Future<void> refreshUsers(UsersParams usersParams) async {
    await _fetchData(usersParams);
  }

  Future<void> _fetchData(UsersParams usersParams) async {
    if (usersParams.page == 1) {
      emit(state.copyWith(status: UserStatus.loading));
    }

    final _data = await _getUser.call(usersParams);
    _data.fold(
          (l) {
        if (l is ServerFailure) {
          emit(
            state.copyWith(
              status: UserStatus.failure,
              message: l.message,
            ),
          );
        } else if (l is NoDataFailure) {
          emit(state.copyWith(status: UserStatus.empty));
        }
      },
          (r) => emit(state.copyWith(status: UserStatus.success, users: r)),
    );
  }
}