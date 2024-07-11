import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/models.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);
  Future<void> signInGoogle();
  Future<UserModel> signUp(UserModel userModel, String password);
  Future<void> setUserData(UserModel user);
  Future<void> logOut();
}
