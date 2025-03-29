import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String email;
  final String uId;
  factory UserModel.fromirebaseUser(User user) {
    return UserModel(email: user.email ?? '', uId: user.uid);
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], uId: json['uId']);
  }

  UserModel({required this.email, required this.uId});

  toJson() {
    return {'email': email, 'uId': uId};
  }
}
