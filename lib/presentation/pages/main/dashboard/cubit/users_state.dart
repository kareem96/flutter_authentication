part of 'users_cubit.dart';

enum UserStatus { loading, success, failure, empty }

extension UserStatusX on UserStatus {
  bool get isLoading => this == UserStatus.loading;
  bool get isSuccess => this == UserStatus.success;
  bool get isFailure => this == UserStatus.failure;
  bool get isEmpty => this == UserStatus.empty;
}

class UsersState extends Equatable {
  final UserStatus status;
  final Users? users;
  final String? message;

  const UsersState({this.status = UserStatus.loading, this.users, this.message});

  UsersState copyWith({
  UserStatus? status,
  Users? users,
  String? message,
}){
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      message: message ?? this.message,
    );
  }
  @override
  List<Object?> get props => [status, users, message];
}
