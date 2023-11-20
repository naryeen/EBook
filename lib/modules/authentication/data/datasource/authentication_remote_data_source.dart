import 'dart:convert';

import 'package:todo/cores/errors/exceptions.dart';
import 'package:todo/cores/utils/constants.dart';
import 'package:todo/modules/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  Future<List<UserModel>> getUser();
}

// for endpoint
const kCreateUserEndpoint = 'users';
const kGetUserEndpoint = '/users';

class AuthRemoteDataSrcImpl implements AuthenticationRemoteDataSource {
  const AuthRemoteDataSrcImpl(this._client);
  final http.Client _client;
  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    //1... check to make sure that it returns the right data when the response
    // code is 200 or the proper respponse code
    // 2.. check to make sure that it throw a CUSTOM EXCEPTION woth the right message when status code
    // is the bad one
    //     final response = await _client.post(

    final response = await _client.post(
      Uri.parse('$kBaseUrl$kCreateUserEndpoint'),
      body: jsonEncode({
        'createdAt': 'createdAt',
        'name': 'name',
        'avatar': 'avatar',
      }),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw APIException(
        message: response.body,
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<List<UserModel>> getUser() async {
    throw UnimplementedError();
  }
}
