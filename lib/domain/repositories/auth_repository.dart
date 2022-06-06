import 'package:dartz/dartz.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/domain/domain.dart';

abstract class AuthRepository{
  Future<Either<Failure, Register>> register(RegisterParams registerParams);
  Future<Either<Failure, Login>> login(LoginParams loginParams);
}