import 'dart:convert';

import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/di/di.dart';
import 'package:flutter_auth/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';

void main() {
  late DioAdapter dioAdapter;
  late AuthRemoteDatasourceImpl datasourceImpl;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    dioAdapter = DioAdapter(dio: sl<DioClient>().dio);
    datasourceImpl = AuthRemoteDatasourceImpl(sl<DioClient>());
  });

  group("register", () {
    final _registerParams =
        RegisterParams(email: "eve.holt@reqres.in", password: "pistol");
    final _registerModel =
        RegisterResponse.fromJson(json.decode(jsonReader(successRegisterPath)));

    test(
      "should return register success model when response code is  200",
      () async {
        dioAdapter.onPost(
          ListApi.register,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successRegisterPath)),
          ),
          data: _registerParams.toJson(),
        );
        //act
        final _result = await datasourceImpl.register(_registerParams);
        //assert
        expect(_registerModel, equals(_result));
      },
    );

    test(
      "should return register unsuccessful model when response code is 400",
      () async {
        dioAdapter.onPost(
          ListApi.register,
          (server) => server.reply(400, json.decode(jsonReader(unSuccessRegisterPath))),
          data: _registerParams.toJson(),
        );
        //act
        final _result = datasourceImpl.register(_registerParams);
        //assert
        expect(_result, throwsA(isA<ServerException>()));
      },
    );
  });
}
