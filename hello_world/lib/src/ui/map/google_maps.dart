import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  GoogleMaps({Key key }) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        }
      ),
    );
  }
}
