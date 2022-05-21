import 'package:flutter/material.dart';
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

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  Loc.Location _location = Loc.Location();

  var lng, lat;

  bool _searched = false;

  @override
  initState() {
    super.initState();
    _searched = false;
    getLocation();
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

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;

    _location.onLocationChanged.listen((loc) {
      
    });
  }

  Future getLocation() async {
    final location = Loc.Location();
    var currentLocation = await location.getLocation();

    setState(() {
      lat = currentLocation.latitude;
      lng = currentLocation.longitude;
      _searched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            (lat == null || lng == null) ? 
            Container() : GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(lat, lng), zoom: 15),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false
            ),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }
}
