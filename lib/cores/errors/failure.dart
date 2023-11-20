import 'package:equatable/equatable.dart';
import 'package:todo/cores/errors/exceptions.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object> get props => [message, statusCode];
}

// types of failure we can have like
// server failure, data source from server, remote or local , cash failure
//
class APIFailure extends Failure {
  // Collect the message and pass this to the supper class...
  const APIFailure({required super.message, required super.statusCode});
  APIFailure.fromException(APIException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
