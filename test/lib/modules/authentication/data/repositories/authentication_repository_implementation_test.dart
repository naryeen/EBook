import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/modules/authentication/data/authentication_repository_implementation.dart';
import 'package:todo/modules/authentication/data/datasource/authentication_remote_data_source.dart';

class MockAuthRemoteSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;
  setUp(() {
    remoteDataSource = MockAuthRemoteSrc(); 
    repoImpl = AuthenticationRepositoryImplementation(_remoteDataSource);
  });

  group('createUser', () { 
    test('shoule call the [RemoteDataSource.CreateUser] and complete successfully when the call to the remote is successufll', () => null)
  });
}
