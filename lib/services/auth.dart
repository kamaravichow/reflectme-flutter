import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User?> get userAuthState => _auth.authStateChanges();

  User? get user => _auth.currentUser;

  Future<User?> emailSignUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkEmailVerification() async {
    User user = _auth.currentUser!;
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      return false;
    }
    return user.emailVerified;
  }

  Future<User?> emailLogin(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("updating user data");
      updateUserdata(userCredential.user);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      _showSnackbar(e.message ?? 'Error', context);
      return null;
    }
  }

  Future<void> updateUserdata(User? user) {
    DocumentReference users = _db.collection("users").doc(user!.uid);
    return users.set({
      'id': user.uid,
      'login': DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  _showSnackbar(String message, BuildContext context) {
    var snackbar = new SnackBar(
        backgroundColor: Colors.white,
        content: Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 30,
          child: Text(
            message,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
