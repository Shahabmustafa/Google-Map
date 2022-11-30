import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLine extends StatefulWidget {
  const PolyLine({Key? key}) : super(key: key);

  @override
  State<PolyLine> createState() => _PolyLineState();
}

class _PolyLineState extends State<PolyLine> {

  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  List<LatLng> _latlng = [
    LatLng(34.175327, 71.859632),
    LatLng(34.177321, 71.857342),
    LatLng(34.178889, 71.855600),
  ];

  static const CameraPosition _cameraPosition =  CameraPosition(
    target: LatLng(34.175330, 71.859783),
    zoom: 15.0
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  
  loadData(){
    for(int i = 0; i < _latlng.length; i++){
      _markers.add(
          Marker(
              markerId: MarkerId('1'),
            position: _latlng[i],
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: 'Location${i.toString()}',
              snippet: "${i.toString()} Stars Ranking"
            ),
          ),
      );
      setState(() {

      });
      _polyline.add(
        Polyline(
          polylineId: PolylineId('1'),
          points: _latlng,
          color: Colors.yellow
        ),
      );
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        polylines: _polyline,
        markers: _markers,
      ),
    );
  }
}
