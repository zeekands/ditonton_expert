import 'package:dartz/dartz.dart';
import 'package:core/common/failure.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> execute(P params);
}
