import 'package:flutter/material.dart';
import 'package:gide/screens/place_locator/filter_item.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PlaceLocator extends StatefulWidget {
  const PlaceLocator({Key? key}) : super(key: key);

  @override
  State<PlaceLocator> createState() => _PlaceLocatorState();
}

class _PlaceLocatorState extends State<PlaceLocator> {
  late GoogleMapController _controller;

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  Location _location = Location();

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
                onPressed: () {},
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
      _controller.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(loc.latitude!, loc.longitude!), zoom: 15)));
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
            GoogleMap(
              initialCameraPosition: CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
            ),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }
}
