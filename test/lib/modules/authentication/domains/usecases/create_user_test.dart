//  what are those class depends on
// answer AuthenticationRepository
// how can we create a fake version of the dependancy ()
// Aswer:::MockTail
// How do we control what our dependancies do (MockTail and Mocktio)
// Answer:: Using MockTail API

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/modules/authentication/domains/repositories/authentication_repository.dart';
import 'package:todo/modules/authentication/domains/usecases/create_user.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;
  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });
  const params = CreateUserParams.empty();

  test(
    'should call the [AuthRepo.createUser]',
    () async {
      // Arrange()
      // STUB
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async => const Right(null));
      // Act

      final result = await usecase(params);
      // Assert
      expect(result, equals(const Right<dynamic, void>(null)));
      // verifying that there is a true call
      verify(
        () => repository.createUser(
            createdAt: params.createdAt,
            name: params.name,
            avatar: params.avatar),
      ).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
