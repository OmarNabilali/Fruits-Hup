import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/features/auth/domain/entitits/user_entitis.dart';

class UserModel extends UserEntitis {
  UserModel({required super.name, required super.email, required super.uid});
  factory UserModel.fromFirebaseAuth(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  factory UserModel.fromEntity(UserEntitis user) {
    return UserModel(name: user.name, email: user.email, uid: user.uid);
  }

  toMap() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
