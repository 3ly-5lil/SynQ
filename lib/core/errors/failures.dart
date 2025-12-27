import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failed']);
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error occurred']);
}

// Auth failures
class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication failed']);
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure([
    super.message = 'Invalid email or password',
  ]);
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure([super.message = 'User not found']);
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure([super.message = 'Email already in use']);
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure([super.message = 'Password is too weak']);
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure([super.message = 'Invalid email format']);
}

// Firestore failures
class FirestoreFailure extends Failure {
  const FirestoreFailure([super.message = 'Database error occurred']);
}

class DocumentNotFoundFailure extends Failure {
  const DocumentNotFoundFailure([super.message = 'Document not found']);
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure([super.message = 'Permission denied']);
}

// Storage failures
class StorageFailure extends Failure {
  const StorageFailure([super.message = 'Storage error occurred']);
}

class FileUploadFailure extends Failure {
  const FileUploadFailure([super.message = 'File upload failed']);
}

class FileNotFoundFailure extends Failure {
  const FileNotFoundFailure([super.message = 'File not found']);
}
