import 'package:todo/cores/utils/typedef.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  // Either<Exception, void>
  // Future<Either<Failure, void>> createUser(
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

// reture a list of users
  ResultFuture<List<User>> getUser();

  // getUsers() {}
}
