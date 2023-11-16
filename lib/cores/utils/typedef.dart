// create one shot generic name for a type,

import 'package:dartz/dartz.dart';
import 'package:todo/cores/errors/failure.dart';

// clean arthitecture, right side right or sucessful return type and left side is failure
typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
