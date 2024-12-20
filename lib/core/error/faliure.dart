import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/// General failures
class ServerFailure extends Failure {
  final int? statusCode;

    const ServerFailure(super.errorMessage, {this.statusCode});
}


class TokenFailure extends Failure {
  final int? statusCode;

  const TokenFailure(super.errorMessage,{ this.statusCode});
}

class ConnectionFailure extends Failure{
  const ConnectionFailure(super.errorMessage);
}

///storage faliure
class StorageFailure extends Failure {
  const StorageFailure(super.errorMessage);
}