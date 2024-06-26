import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kidcare/screen/shedulBord.dart';

class pinwayBord extends StatefulWidget {
  const pinwayBord({super.key, required String title});

  @override
  State<pinwayBord> createState() => pinwayBordState();
}

class pinwayBordState extends State<pinwayBord> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

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
        centerTitle: true,
        title: const Text(
          'Pin your way',
          style: TextStyle(
              fontSize: 22,
              color: Color.fromARGB(255, 247, 84, 84),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          style: ButtonStyle(
            iconSize: MaterialStateProperty.all<double>(30),
            iconColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 252, 251, 251)),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 240, 113, 113)),
          ),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      textAlign: TextAlign.center,
                      controller: _originController,
                      decoration: const InputDecoration(
                        hintText: 'origin',
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      controller: _destinationController,
                      decoration: const InputDecoration(
                        hintText: 'Destination',
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SheduleBord(
                              title: '',
                            )),
                  );
                },
              ),
            ],
          ),
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
