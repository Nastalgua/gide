import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Announcement extends Equatable {
  final String text;
  final Timestamp timestamp;
  final String storeId;

  const Announcement({
    required this.text,
    required this.timestamp,
    required this.storeId
  });

  @override
  List<Object?> get props => [text, timestamp, storeId];

  factory Announcement.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Announcement(
      text: data?['text'],
      timestamp: data?['timestamp'],
      storeId: data?['storeId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (text != null) "text": text,
      if (timestamp != null) "timestamp": timestamp,
      if (storeId != null) "storeId": storeId,
    };
  }

  Announcement.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        timestamp = json['timestamp'],
        storeId = json['storeId'];

  Map<String, dynamic> toJson() => {
    'text': text,
    'timestamp': timestamp,
    'storeId': storeId,
  };
}