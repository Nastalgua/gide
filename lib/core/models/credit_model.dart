import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final String id;
  final DateTime expireDate;
  final String restaurantId;

  const Credit({
    required this.id,
    required this.expireDate,
    required this.restaurantId,
  });

  @override
  List<Object?> get props => [id, expireDate, restaurantId];

  factory Credit.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Credit(
      id: data?['id'],
      expireDate: data?['expireDate'],
      restaurantId: data?['restaurantId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (expireDate != null) "expireDate": expireDate,
      if (restaurantId != null) "type": restaurantId,
    };
  }
}