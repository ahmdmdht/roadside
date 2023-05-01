import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  late GoogleMapController newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Set<Marker> markers = {};



  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;
            },
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: ElevatedButton(
              onPressed: () async {
                Position position = await _determinePosition();

                newGoogleMapController
                    .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


                markers.clear();

                markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

                setState(() {});

              },
              child: Row(
                children: [
                  Icon(Icons.location_history),
                  Text('Current Location'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
