import 'package:equatable/equatable.dart';
import 'package:flutter_auth/domain/entities/auth/create.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/core.dart';
import '../../../../../domain/usecase/auth/post_create.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  final PostCreate _postCreate;

  CreateCubit(this._postCreate) : super(const CreateState());

  Future<void> create(CreateParams params) async {
    emit(state.copyWith(status: CreateStatus.loading));
    final _data = await _postCreate.call(params);

    _data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(
            state.copyWith(
              status: CreateStatus.failure,
              message: l.message,
            ),
          );
        }
      },
      (r) {
        emit(
          state.copyWith(status: CreateStatus.success, create: r),
        );
      },
    );
  }
}
