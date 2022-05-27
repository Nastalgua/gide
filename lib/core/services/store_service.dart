import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gide/core/models/store_model.dart';
import 'package:gide/core/services/auth_service.dart';

class StoreSerice {
  // Assumes user is logged in
  static CollectionReference stores = FirebaseFirestore.instance.collection('stores');

  static void updateStore(Store store) async {
    User? user = AuthenticationService.getCurrentUser();
    if (user == null) return; // should put an error message here

    await stores.doc(store.id).withConverter(
      fromFirestore: Store.fromFirestore, 
      toFirestore: (Store restaurant, options) => restaurant.toFirestore(),
    ).set(store);
  }
}