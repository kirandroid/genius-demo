import 'package:dartz/dartz.dart';
import 'package:genius_demo/core/error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
