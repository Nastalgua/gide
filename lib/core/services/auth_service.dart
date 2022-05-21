import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth_module;

import 'package:google_sign_in/google_sign_in.dart' as google_module;

class AuthenticationService {
  static final _googleSignIn = google_module.GoogleSignIn();
  static final auth = firebase_auth_module.FirebaseAuth.instance;

  static CollectionReference users = FirebaseFirestore.instance.collection('users');

  static Future<firebase_auth_module.User?> loginWithGoogle() async {
    final google_module.GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = firebase_auth_module.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final response = await firebase_auth_module.FirebaseAuth.instance.signInWithCredential(credential);

    if (response.additionalUserInfo!.isNewUser) {
      await users.doc(response.user?.uid).set(
        {
          'id': response.user?.uid,
          'displayName': response.user?.displayName
        }
      );
    }

    return Future.value(response.user);
  }

  static Future<firebase_auth_module.User?> loginWithEmailAndPassword(email, password) async {
    final firebase_auth_module.UserCredential? credential = await auth.signInWithEmailAndPassword(email: email, password: password);

    return Future.value(credential?.user);
  }

  static Future<firebase_auth_module.User?> registerWithEmailAndPassword(email, password, username) async {
    final firebase_auth_module.UserCredential? credential = await auth.createUserWithEmailAndPassword(email: email, password: password);

    await users.doc(credential?.user?.uid).set(
      {
        'id': credential?.user?.uid,
        'displayName': username
      }
    );

    return Future.value(credential?.user);
  }

  static firebase_auth_module.User? getCurrentUser() {
    /*
    final completer = Completer<firebase_auth_module.User>();
    firebase_auth_module.FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      completer.complete(firebaseUser);
    });

    return completer.future;
    */
    return firebase_auth_module.FirebaseAuth.instance.currentUser;
  }

  static Future firebaseLogout() async {
    await firebase_auth_module.FirebaseAuth.instance.signOut();
  }
}
