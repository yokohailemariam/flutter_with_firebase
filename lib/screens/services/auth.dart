import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user object reposnse from firebase

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // login Anonymous

  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();

      User? user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      if (kDebugMode) {
        print('error $e');
      }
      return null;
    }
  }

  //signout

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
        return null;
      }
    }
  }
}
