import 'package:dartz/dartz.dart';
import 'package:synq/core/errors/failures.dart';
import 'package:synq/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  /// Sign in with email and password
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  /// Sign up with email and password
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String displayName,
  });

  /// Sign in with Google
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  /// Sign out
  Future<Either<Failure, void>> signOut();

  /// Get current user
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Check if user is signed in
  Future<Either<Failure, bool>> isSignedIn();

  /// Update user profile
  Future<Either<Failure, UserEntity>> updateProfile({
    required String uid,
    String? displayName,
    String? bio,
    String? photoUrl,
  });

  /// Check if username is available
  Future<Either<Failure, bool>> isUsernameAvailable(String username);

  /// Reset password
  Future<Either<Failure, void>> resetPassword(String email);
}
