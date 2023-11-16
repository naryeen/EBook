import 'package:todo/cores/usecase/usecase.dart';
import 'package:todo/cores/utils/typedef.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';
import 'package:todo/modules/authentication/domains/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithOutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUser();
}

 
 
