import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:synq/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.username,
    required super.displayName,
    super.photoUrl,
    super.bio,
    super.followers,
    super.following,
    super.posts,
    required super.createdAt,
  });

  /// Create UserModel from UserEntity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      email: entity.email,
      username: entity.username,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
      bio: entity.bio,
      followers: entity.followers,
      following: entity.following,
      posts: entity.posts,
      createdAt: entity.createdAt,
    );
  }

  /// Create UserModel from Firestore DocumentSnapshot
  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      displayName: data['displayName'] ?? '',
      photoUrl: data['photoUrl'],
      bio: data['bio'],
      followers: data['followers'] ?? 0,
      following: data['following'] ?? 0,
      posts: data['posts'] ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      displayName: json['displayName'] ?? '',
      photoUrl: json['photoUrl'],
      bio: json['bio'],
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      posts: json['posts'] ?? 0,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// Convert UserModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
      'posts': posts,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  /// Convert to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      email: email,
      username: username,
      displayName: displayName,
      photoUrl: photoUrl,
      bio: bio,
      followers: followers,
      following: following,
      posts: posts,
      createdAt: createdAt,
    );
  }

  @override
  UserModel copyWith({
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
    return UserModel(
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
