import 'package:dartz/dartz.dart';
import 'package:synq/core/errors/exceptions.dart';
import 'package:synq/core/errors/failures.dart';
import 'package:synq/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:synq/features/auth/domain/entities/user_entity.dart';
import 'package:synq/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signInWithEmail(email, password);
      return Right(user.toEntity());
    } on AuthException catch (e) {
      return Left(_mapAuthException(e));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String displayName,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmail(
        email,
        password,
        username,
        displayName,
      );
      return Right(user.toEntity());
    } on AuthException catch (e) {
      return Left(_mapAuthException(e));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.signInWithGoogle();
      return Right(user.toEntity());
    } on AuthException catch (e) {
      return Left(_mapAuthException(e));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user?.toEntity());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    try {
      final isSignedIn = await remoteDataSource.isSignedIn();
      return Right(isSignedIn);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String uid,
    String? displayName,
    String? bio,
    String? photoUrl,
  }) async {
    try {
      final user = await remoteDataSource.updateProfile(
        uid: uid,
        displayName: displayName,
        bio: bio,
        photoUrl: photoUrl,
      );
      return Right(user.toEntity());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isUsernameAvailable(String username) async {
    try {
      final isAvailable = await remoteDataSource.isUsernameAvailable(username);
      return Right(isAvailable);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await remoteDataSource.resetPassword(email);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(_mapAuthException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// Map AuthException to appropriate Failure
  Failure _mapAuthException(AuthException exception) {
    switch (exception.code) {
      case 'user-not-found':
        return UserNotFoundFailure(exception.message);
      case 'wrong-password':
      case 'invalid-credential':
        return InvalidCredentialsFailure(exception.message);
      case 'email-already-in-use':
        return EmailAlreadyInUseFailure(exception.message);
      case 'weak-password':
        return WeakPasswordFailure(exception.message);
      case 'invalid-email':
        return InvalidEmailFailure(exception.message);
      default:
        return AuthFailure(exception.message);
    }
  }
}
