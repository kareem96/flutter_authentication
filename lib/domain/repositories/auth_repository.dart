import 'package:dartz/dartz.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/domain/domain.dart';
import 'package:flutter_auth/domain/entities/auth/create.dart';
import 'package:flutter_auth/domain/usecase/auth/post_create.dart';

abstract class AuthRepository{
  Future<Either<Failure, Register>> register(RegisterParams registerParams);
  Future<Either<Failure, Create>> create(CreateParams createParams);
  Future<Either<Failure, Login>> login(LoginParams loginParams);
  Future<Either<Failure, Users>> users(UsersParams usersParams);
}