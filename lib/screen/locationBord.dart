import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share/share.dart';

class LocationBoard extends StatefulWidget {
  const LocationBoard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LocationBoardState createState() => _LocationBoardState();
}

class _LocationBoardState extends State<LocationBoard> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.9271, 79.8612), // Colombo coordinates
    zoom: 14.0, // You can adjust the zoom level as needed
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share your location'),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: _currentLocation,
        label: const Text('Share your location!'),
        icon: const Icon(Icons.person),
      ),
    );
  }

  Future<void> _currentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final String message =
          'Check out my current location: https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

      Share.share(message);
    } catch (e) {
      // Handle errors
      print('Error getting current location: $e');
    }
  }
}
