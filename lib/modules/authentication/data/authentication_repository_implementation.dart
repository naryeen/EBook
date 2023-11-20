import 'package:dartz/dartz.dart';
import 'package:todo/cores/errors/exceptions.dart';
import 'package:todo/cores/errors/failure.dart';
import 'package:todo/cores/utils/typedef.dart';
import 'package:todo/modules/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';
import 'package:todo/modules/authentication/domains/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);
  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // Test Driven Development
    // call the remote data source
    // make sure that it returns the proper data if there is no exception
    // check if the methods returns proper data...
    // check and if it doesn't throw and exception, we return the actual
    // expected data,
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      //when we want to return a void
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUser() async {
    try {
      final result = await _remoteDataSource.getUser();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  // @override
  // getUsers() {
  //   //
  //   throw UnimplementedError();
  // }
}
