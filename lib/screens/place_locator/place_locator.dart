import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:gide/core/models/store_model.dart';
import 'package:gide/screens/place_locator/filter_item.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart' as GooglePlace;
import 'package:location/location.dart' as Loc;

class PlaceLocator extends StatefulWidget {
  const PlaceLocator({Key? key}) : super(key: key);

  @override
  State<PlaceLocator> createState() => _PlaceLocatorState();
}

class _PlaceLocatorState extends State<PlaceLocator> {
  late GoogleMapController _controller;

  var lng, lat;

  bool _mapLoading = true;

  bool isMapVisible = false;

  final geo = Geoflutterfire();
  final _firestore = FirebaseFirestore.instance;
  late StreamSubscription _subscription;

  List<Store> stores = [];



  @override
  initState() {
    super.initState();

    getLocation();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Widget _buildFilters() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FilterItem(name: "Interests"),
          FilterItem(name: "Surprise Me!"),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        hintText: "Search here...",
        hintStyle: const TextStyle(color: Color(0xFFC2C2C2)),
        suffixIcon: const Icon(Icons.search, color: Color(0xFF3D3D3D)),
        filled: true,
        fillColor: Colors.white
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 15,
      right: 15,
      left: 15,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: const Color(0xFFF6F6F6), borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                splashColor: Colors.grey,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              _buildTextField(),
              _buildFilters()
            ],
          ),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller = controller;

    Future.delayed(
      const Duration(milliseconds: 550),
        () => setState(() {isMapVisible = true;}
      )
    );

    if (lat != null && lng != null) {
      await getNearbyStores(LatLng(lat, lng), 1);
    }
  }

  Future getLocation() async {
    final location = Loc.Location();
    var currentLocation = await location.getLocation();

    setState(() {
      lat = currentLocation.latitude;
      lng = currentLocation.longitude;
    });
  }

  // distance in km
  Future<void> getNearbyStores(LatLng loc, double distance) async {
    GeoFirePoint center = geo.point(latitude: loc.latitude, longitude: loc.longitude);

    var collectionReference = _firestore.collection('stores');
    Stream<List<DocumentSnapshot>> stream = geo.collection(
      collectionRef: collectionReference
    )
    .within(
      center: center, 
      radius: distance, 
      field: 'location', 
      strictMode: true
    );

    _subscription = stream.listen((List<DocumentSnapshot> documentList) {
      documentList.forEach((doc) { 
        Store store = Store.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>, null);
        stores.add(store);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(stores.length);
      }),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            (lat == null || lng == null) ? 
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[100],
              child: const Center(
                child: CircularProgressIndicator(),
              )
            ) : AnimatedOpacity(
              curve: Curves.fastOutSlowIn,
              opacity: isMapVisible ? 1.0 : 0,
              duration: const Duration(milliseconds: 600),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: LatLng(lat, lng), zoom: 15),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false
              ),
            ),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }
}
