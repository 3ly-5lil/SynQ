import 'package:dartz/dartz.dart';
import 'package:synq/core/errors/failures.dart';

/// Base class for all use cases
/// [Type] is the return type
/// [Params] is the input parameter type
// ignore: avoid_types_as_parameter_names
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use this class when the use case doesn't need any parameters
class NoParams {
  const NoParams();
}
