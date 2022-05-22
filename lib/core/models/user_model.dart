import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:gide/core/models/credit_model.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String? restaurantId;
  List<Credit>? credits = [];
  List<String>? favoriteRestaurants = [];

  User({
    required this.id,
    required this.username,
    this.restaurantId,
    required this.credits,
    required this.favoriteRestaurants
  });

  @override
  List<Object?> get props => [id, username, restaurantId];

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return User(
      id: data?['id'],
      username: data?['username'],
      restaurantId: data?['restaurantId'],
      credits:
        data?['credits'] is Iterable ? List.from(data?['credits']) : null,
      favoriteRestaurants: 
        data?['favoriteRestaurants'] is Iterable ? List.from(data?['favoriteRestaurants']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (username != null) "username": username,
      if (restaurantId != null) "restaurantId": restaurantId,
      if (credits != null) "credits": credits,
      if (favoriteRestaurants != null) "favoriteRestaurants": favoriteRestaurants
    };
  }
}
