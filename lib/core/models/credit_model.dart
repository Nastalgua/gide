import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Credit extends Equatable {
  final String id;
  final Timestamp expireDate;
  final String storeId;
  final double amtOff;
  final String storeName;

  const Credit({
    required this.id,
    required this.expireDate,
    required this.storeId,
    required this.amtOff,
    required this.storeName
  });

  @override
  List<Object?> get props => [id, expireDate, storeId];

  Credit.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        expireDate = json['expireDate'],
        storeId = json['storeId'],
        amtOff = json['amtOff'],
        storeName = json['storeName'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'expireDate': expireDate,
    'storeId': storeId,
    'amtOff': amtOff,
    'storeName': storeName
  };

  factory Credit.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Credit(
      id: data?['id'],
      expireDate: data?['expireDate'],
      storeId: data?['storeId'],
      amtOff: data?['amtOff'],
      storeName: data?['storeName']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (expireDate != null) "expireDate": expireDate,
      if (storeId != null) "storeId": storeId,
      if (amtOff != null) "amtOff": amtOff,
      if (storeName != null) "storeName": storeName
    };
  }
}