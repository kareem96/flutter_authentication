import 'package:dartz/dartz.dart';
import 'package:flutter_auth/core/core.dart';

import '../../domain.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) {
    return _repo.register(params);
  }
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({this.email = "", this.password = ""});

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
