import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MultipleMarker extends StatefulWidget {
  const MultipleMarker({Key? key}) : super(key: key);

  @override
  State<MultipleMarker> createState() => _MultipleMarkerState();
}

class _MultipleMarkerState extends State<MultipleMarker> {

  Uint8List? markerImage;

  Future<Uint8List> getBytesFromAssets(String path,int width)async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }


  final Completer<GoogleMapController> _completer = Completer();

  List<String> images = [
    'images/car.png',
    'images/car1.png',
    'images/car2.png',
    'images/car3.png',
    'images/car4.png',
    'images/car5.png'
  ];

  final List<Marker> _marker = [Marker(markerId: MarkerId('1'),position: LatLng(34.175330, 71.859783))];
  final List<LatLng> _latlng = [
    LatLng(34.175330, 71.859783),
    LatLng(34.176661, 71.866949),
    LatLng(34.176408, 71.866227),
    LatLng(34.176263, 71.865985),
    LatLng(34.176083, 71.865301),
    LatLng(34.175953, 71.864880),
  ];


  static const CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
    target: LatLng(34.175330, 71.859783),
    zoom: 19.151926040649414,
  );

  loadData()async{
    for(int i=0; i < images.length; i++){
      print('images: ${_marker[i]}');
      var markerIcon = await getBytesFromAssets(images[i], 100);
      _marker.add(
        Marker(markerId: MarkerId(i.toString()),
          position: _latlng[i],
          icon: BitmapDescriptor.fromBytes(markerIcon),
          infoWindow: InfoWindow(
            title: 'This is my ${i.toString()} Position',
          ),
        ),
      );
      setState(() {

      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition: const CameraPosition(
              target: LatLng(34.175330, 71.859783),
            zoom: 14.0,
          ),
        mapType: MapType.normal,
        // myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
            _completer.complete(controller);
        },
      ),
    );
  }
}
