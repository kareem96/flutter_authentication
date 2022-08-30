import 'package:dartz/dartz.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/data/datasources/datasources.dart';
import 'package:flutter_auth/domain/domain.dart';
import 'package:flutter_auth/domain/entities/auth/create.dart';
import 'package:flutter_auth/domain/usecase/auth/post_create.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams)async {
    try{
      final _response = await authRemoteDatasource.login(loginParams);
      return Right(_response.toEntity());
    }on ServerException catch (e){
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Register>> register(RegisterParams registerParams) async {
    try{
      final _response = await authRemoteDatasource.register(registerParams);
      return Right(_response.toEntity());
    }on ServerException catch(e){
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Users>> users(UsersParams usersParams)async {
    try{
      final _response = await authRemoteDatasource.users(usersParams);
      if(_response.data?.isEmpty ?? true){
        return Left(NoDataFailure());
      }
      return Right(_response.toEntity());
    }on ServerException catch(e){
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Create>> create(CreateParams createParams) async{
    try{
      final _response = await authRemoteDatasource.createUsers(createParams);
      return Right(_response.toEntity());
    }on ServerException catch (e){
      return Left(ServerFailure(e.message));
    }
  }

}