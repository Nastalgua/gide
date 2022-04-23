import 'package:flutter/material.dart';

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
      ),
    );
  }

  PreferredSize? _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(140),
      child: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7E7E7E)),
          onPressed: () {},
          //onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF6F6F6)
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField()
              ],
            ),
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
      appBar: _buildAppBar(),
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
                zoomGesturesEnabled: true)
          ],
        ),
      ),
    );
  }
}
