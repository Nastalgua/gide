import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gide/core/models/credit_model.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String? storeId;
  List<Credit>? credits = [];
  List<String>? favoriteStores = [];

  User({
    required this.id,
    required this.username,
    this.storeId,
    required this.credits,
    required this.favoriteStores
  });

  @override
  List<Object?> get props => [id, username, storeId];

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    List<Credit> creditsConverted = [];
    if (data?['credits'] != null) {
      creditsConverted = data?['credits']!.map<Credit>((e) => Credit.fromJson(e)).toList();
    }

    return User(
      id: data?['id'],
      username: data?['username'],
      storeId: data?['storeId'],
      credits:
        data?['credits'] is Iterable ? creditsConverted : null,
      favoriteStores: 
        data?['favoriteStores'] is Iterable ? List.from(data?['favoriteStores']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    List<Map<String, Object?>> creditsConverted = [];

    if (credits != null) {
      creditsConverted = credits!.map((e) => e.toJson()).toList();
    }

    return {
      if (id != null) "id": id,
      if (username != null) "username": username,
      if (storeId != null) "storeId": storeId,
      if (credits != null) "credits": creditsConverted,
      if (favoriteStores != null) "favoriteRestaurants": favoriteStores
    };
  }
}
