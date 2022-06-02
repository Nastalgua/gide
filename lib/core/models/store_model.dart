import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_place/google_place.dart';

class Store extends Equatable {
  final String id;
  final String name;
  final String description;
  final String ownerId;
  final GeoFirePoint location;
  final List<String> announcements;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.location,
    required this.announcements
  });

  @override
  List<Object?> get props => [id, name, location];

  factory Store.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    final geo = Geoflutterfire();

    return Store(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      location: geo.point(
        latitude: data?['location']['geopoint'].latitude, 
        longitude: data?['location']['geopoint'].longitude
      ),
      ownerId: data?['ownerId'],
      announcements: data?['announcements']
      // regions:
      //     data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (location != null) "location": location.data,
      if (ownerId != null) "ownerId": ownerId,
      if (announcements != null) "announcements": announcements
    };
  }
}