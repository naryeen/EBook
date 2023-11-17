import 'package:todo/cores/utils/typedef.dart';
import 'package:todo/modules/authentication/domains/entities/user.dart';
import 'package:todo/modules/authentication/domains/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  @override
  ResultVoid createUser({
      {required String createdAt,
      required String name,
      required String avatar
      
      }) async {
        final Datasource = ,
      }
       
    
  

  @override
  ResultFuture<List<User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
