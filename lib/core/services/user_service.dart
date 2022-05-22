import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gide/core/models/user_model.dart' as self_module;
import 'package:gide/core/services/auth_service.dart';

class UserService {
  // Assumes user is logged in
  static CollectionReference stores = FirebaseFirestore.instance.collection('users');

  static void updateUser(self_module.User changedUser) async {
    User? user = AuthenticationService.getCurrentUser();
    if (user == null) return; // should put an error message here

    await stores.doc(user.uid)
      .withConverter(
        fromFirestore: self_module.User.fromFirestore, 
        toFirestore: (self_module.User tempUser, options) => tempUser.toFirestore()
      )
      .set(changedUser);
  }
}