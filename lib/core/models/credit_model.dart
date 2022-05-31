import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final String id;
  final Timestamp expireDate;
  final String storeId;
  final double amtOff;

  const Credit({
    required this.id,
    required this.expireDate,
    required this.storeId,
    required this.amtOff
  });

  @override
  List<Object?> get props => [id, expireDate, storeId];

  factory Credit.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Credit(
      id: data?['id'],
      expireDate: data?['expireDate'],
      storeId: data?['storeId'],
      amtOff: data?['amtOff']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (expireDate != null) "expireDate": expireDate,
      if (storeId != null) "storeId": storeId,
      if (amtOff != null) "amtOff": amtOff
    };
  }
}