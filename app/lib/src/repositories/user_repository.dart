import 'dart:async';
import 'package:app/src/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final Firestore _db = Firestore.instance;

  UserRepository({
    FirebaseAuth firebaseAuth,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<AuthResult> signIn({String email, String password}) async{
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResult> signUp({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<FirebaseUser> getUser() async {
    return (await _firebaseAuth.currentUser());
  }

  void addUserToDatabase(UserModel userInfo, FirebaseUser user) async{
    await _db.collection("users").document(user.uid).setData({
      'uid': user.uid,
      'username': userInfo.username,
      'email': userInfo.email,
      'password': userInfo.password,
    });
  }
}