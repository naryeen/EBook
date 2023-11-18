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
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUser() async {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
