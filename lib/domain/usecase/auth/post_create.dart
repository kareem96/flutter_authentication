

import 'package:dartz/dartz.dart';
import 'package:flutter_auth/domain/entities/auth/create.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class PostCreate extends UseCase<Create, CreateParams> {
  final AuthRepository _repo;

  PostCreate(this._repo);

  @override
  Future<Either<Failure, Create>> call(CreateParams params) {
    return _repo.create(params);
  }
}

class CreateParams {
  final String name;
  final String job;

  CreateParams({this.name = "", this.job = ""});

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}