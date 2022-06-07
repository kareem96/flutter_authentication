import 'package:flutter_auth/core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';


abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);

  Future<LoginResponse> login(LoginParams loginParams);

  Future<UserResponse> users(UsersParams usersParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try {
      final _response =
          await _client.postRequest(ListApi.login, data: loginParams.toJson());
      final _result = LoginResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return _result;
      } else {
        throw ServerException(_result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<RegisterResponse> register(RegisterParams registerParams) async {
    try {
      final _response = await _client.postRequest(ListApi.register,
          data: registerParams.toJson());
      final _result = RegisterResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return _result;
      } else {
        throw ServerException(_result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UserResponse> users(UsersParams usersParams) async{
    try{
      final _response = await _client.getRequest(ListApi.users, queryParameters: usersParams.toJson());
      final _result = UserResponse.fromJson(_response.data);
      if(_response.statusCode == 200){
        return _result;
      }else{
        throw ServerException(_result.error);
      }
    }on ServerException catch (e){
      throw ServerException(e.message);
    }
  }
}
