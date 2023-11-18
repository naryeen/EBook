import 'package:todo/modules/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {

  Future <void>createUser({
      required String createdAt,
      required String name,
      required String avatar
      
  });

  Future <List<UserModel>> getUser();

}