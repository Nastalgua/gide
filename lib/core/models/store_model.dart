import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:gide/core/models/announcement_model.dart';
import 'package:gide/core/models/item_model.dart';

class Store extends Equatable {
  final String id;
  final String name;
  final String description;
  final String ownerId;
  final GeoFirePoint location;
  final List<Announcement>? announcements;
  final List<Item>? items;

  Store({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.location,
    required this.announcements,
    required this.items
  });

  @override
  List<Object?> get props => [id, name, location];

  factory Store.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    final geo = Geoflutterfire();

    List<Announcement> announcementConverted = [];
    if (data?['announcements'] != null) {
      announcementConverted = data?['announcements']!.map<Announcement>((e) => Announcement.fromJson(e)).toList();
    }

    return Store(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      location: geo.point(
        latitude: data?['location']['geopoint'].latitude, 
        longitude: data?['location']['geopoint'].longitude
      ),
      ownerId: data?['ownerId'],
      announcements: data?['announcements'] is Iterable ? announcementConverted : null,
      items: data?['items'] is Iterable ? List.from(data?['items']) : null
      // regions:
      //     data?['regions'] is Iterable ? List.from(data?['regions']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    List<Map<String, Object?>> announcementConverted = [];
    if (announcements != null) {
      announcementConverted = announcements!.map((e) => e.toJson()).toList();
    }

    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (location != null) "location": location.data,
      if (ownerId != null) "ownerId": ownerId,
      if (announcements != null) "announcements": announcementConverted, //(announcements == null ? announcements : announcements!.map((e) => e.toJson())),
      if (items != null) "items": items
    };
  }
}