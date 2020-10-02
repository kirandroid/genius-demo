import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super();
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => null;
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message});
  @override
  List<Object> get props => [message];
}
