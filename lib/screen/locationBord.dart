import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationBoard extends StatefulWidget {
  const LocationBoard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LocationBoardState createState() => _LocationBoardState();
}

class _LocationBoardState extends State<LocationBoard> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = <Marker>{};
  final Set<Polygon> _polygons = <Polygon>{};
  final List<LatLng> _polygonLatLongs = <LatLng>[];
  int _polygonIdCounter = 1;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _setMarker(const LatLng(37.42796133580664, -122.085749655962));
  }

  void _setMarker(LatLng latLng) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('id-1'),
          position: latLng,
        ),
      );
    });
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygonIdCounter++;
    _polygons.add(
      Polygon(
          polygonId: PolygonId(polygonIdVal),
          points: _polygonLatLongs,
          strokeWidth: 2,
          fillColor: Colors.transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 193, 211, 226),
        title: const Text('Share Your Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
                mapType: MapType.hybrid,
                markers: _markers,
                polylines: Set<Polyline>.from(_polygons),
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: (point) {
                  _polygonLatLongs.add(point);
                  _setPolygon();
                }),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(lat, lng),
        zoom: 12,
      ),
    ));
    _setMarker(LatLng(lat, lng));
  }
}
