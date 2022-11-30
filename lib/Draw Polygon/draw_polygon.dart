import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawPolygon extends StatefulWidget {
  const DrawPolygon({Key? key}) : super(key: key);

  @override
  State<DrawPolygon> createState() => _DrawPolygonState();
}

class _DrawPolygonState extends State<DrawPolygon> {
  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};
  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(34.202906, 71.774259),
    LatLng(34.137928, 71.729628),
    LatLng(34.182077, 71.738768),
    LatLng(34.202906, 71.774259),

  ];

  static final CameraPosition _cameraPosition = CameraPosition(
      target:  LatLng(34.202906, 71.774259),
    zoom: 14.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(
        Polygon(
            polygonId: PolygonId('1'),
            points: points,
          fillColor: Colors.red.withOpacity(0.3),
          geodesic: true,
          strokeWidth: 4,
          strokeColor: Colors.red
        ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        polygons: _polygon,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
