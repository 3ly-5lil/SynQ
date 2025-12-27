import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String displayName;
  final String? photoUrl;
  final String? bio;
  final int followers;
  final int following;
  final int posts;
  final DateTime createdAt;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.username,
    required this.displayName,
    this.photoUrl,
    this.bio,
    this.followers = 0,
    this.following = 0,
    this.posts = 0,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    uid,
    email,
    username,
    displayName,
    photoUrl,
    bio,
    followers,
    following,
    posts,
    createdAt,
  ];

  UserEntity copyWith({
    String? uid,
    String? email,
    String? username,
    String? displayName,
    String? photoUrl,
    String? bio,
    int? followers,
    int? following,
    int? posts,
    DateTime? createdAt,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      posts: posts ?? this.posts,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
