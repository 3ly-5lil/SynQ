import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:synq/core/errors/failures.dart';
import 'package:synq/core/usecase/usecase.dart';
import 'package:synq/features/auth/domain/entities/user_entity.dart';
import 'package:synq/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithEmail implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUpWithEmail(
      email: params.email,
      password: params.password,
      username: params.username,
      displayName: params.displayName,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String username;
  final String displayName;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.username,
    required this.displayName,
  });

  @override
  List<Object> get props => [email, password, username, displayName];
}
