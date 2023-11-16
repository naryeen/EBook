//  two of usecase likek with the parameter and with out paramaters.

import 'package:todo/cores/utils/typedef.dart';

// with the parameters
abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

// with out parameters
abstract class UsecaseWithOutParams<Type> {
  const UsecaseWithOutParams();
  ResultFuture<Type> call();
}
