import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';
import 'package:todo/modules/authentication/domains/repositories/authentication_repository.dart';
import 'package:todo/modules/authentication/domains/usecases/get_users.dart';
import 'create_user_test.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test(
    'should call the [AuthRepo.GetUsers] and return [list<User>]',
    () async {
      // arrange
      when(() => repository.getUsers()).thenAnswer(
        (_) async => const Right(tResponse),
      );
      // Act
      final result = await usecase();
      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
