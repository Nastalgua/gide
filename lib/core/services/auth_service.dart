import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth_module;

import 'package:google_sign_in/google_sign_in.dart' as google_module;

class AuthenticationService {
  static final _googleSignIn = google_module.GoogleSignIn();

  static Future<firebase_auth_module.User?> loginWithGoogle() async {
    final google_module.GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = firebase_auth_module.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    final response = await firebase_auth_module.FirebaseAuth.instance.signInWithCredential(credential);

    return Future.value(response.user);
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
}
