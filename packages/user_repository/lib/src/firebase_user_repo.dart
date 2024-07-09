import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/models.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp(UserModel userModel, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );

      userModel = userModel.copyWith(userId: user.user!.uid);

      return userModel;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(UserModel user) async {
    try {
      await usersCollection.doc(user.userId).set(user.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}
