import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/cores/errors/exceptions.dart';
import 'package:todo/cores/errors/failure.dart';
import 'package:todo/modules/authentication/data/authentication_repository_implementation.dart';
import 'package:todo/modules/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';

class MockAuthRemoteSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoImpl;
  setUp(() {
    remoteDataSource = MockAuthRemoteSrc();
    repoImpl = AuthenticationRepositoryImplementation(remoteDataSource);
  });

  const tException = APIException(
    message: 'Unknown Error ',
    statusCode: 500,
  );
  group('createUser', () {
    const createdAt = "whatever.createdAt";
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';
    test(
      'should call the [RemoteDataSource.CreateUser] and complete successfully'
      'when the call to the remote source is successful',
      () async {
        // check that remote source's createUser gets called and with the
        // right data

        // arrange
        when(
          () => remoteDataSource.createUser(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')),
          // when you return a void...
        ).thenAnswer((_) async => Future.value());

        // const createdAt = "whatever.createdAt";
        // const name = 'whatever.name';
        // const avatar = 'whatever.avatar';

        // act   (Action...)
        final result = await repoImpl.createUser(
            createdAt: createdAt, name: name, avatar: avatar);

        // asssert <for void we are using the null >
        expect(result, equals(const Right(null)));
        verify(() => remoteDataSource.createUser(
            createdAt: createdAt, name: name, avatar: avatar)).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
    test(
      'should return a [APIFailure] when the'
      ' call to the remote source is unsuccessful',
      () async {
        // arrange
        when(() => remoteDataSource.createUser(
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(
              named: 'avatar',
            ))).thenThrow(tException);

        // Acting
        final result = await repoImpl.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );
        expect(
          result,
          equals(
            Left(
              APIFailure(
                  message: tException.message,
                  statusCode: tException.statusCode),
            ),
          ),
        );
        verify(() => remoteDataSource.createUser(
            createdAt: createdAt, name: name, avatar: avatar)).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
  group('GetUser', () {
    test(
      'should call the [RemoteDataSource.getUser] and return [List<User>]'
      'when call to remote source is successful',
      () async {
        when(() => remoteDataSource.getUser()).thenAnswer(
          (_) async => [],
        );
        final result = await repoImpl.getUser();
        expect(result, isA<Right<dynamic, List<User>>>());
        verify(() => remoteDataSource.getUser()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [APIFailure] when the'
      ' call to the remote source is unsuccessful',
      () async {
        when(() => remoteDataSource.getUser()).thenThrow(tException);
        
        final result = await repoImpl.getUser();
        expect(result, equals(Left(APIFailure.fromException(tException))));
        verify(() => remoteDataSource.getUser()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
