import 'package:dartz/dartz.dart';
import 'package:flutter_auth/domain/domain.dart';

import '../../../core/core.dart';

class GetUsers extends UseCase<Users, UsersParams> {
  final AuthRepository _repo;

  GetUsers(this._repo);

  @override
  Future<Either<Failure, Users>> call(UsersParams params) =>
      _repo.users(params);
}

class UsersParams {
  int page;

  UsersParams({this.page = 1});

  Map<String, dynamic> toJson() => {
    "page": page,
  };
}