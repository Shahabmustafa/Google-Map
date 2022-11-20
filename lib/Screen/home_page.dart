import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final Completer <GoogleMapController> _controller = Completer();

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414,
  );

  List<Marker> _marker = [];
  final List<Marker> _list =  [
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(34.175326, 71.859801),
      infoWindow: InfoWindow(title: 'This is My Position')
    ),
  ];

  Future<Position> getUserCurrentLocation()async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      print('error${error.toString()}');
    });
    return await Geolocator.getCurrentPosition();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // mapType: ,
        initialCameraPosition: _kLake,
        markers: Set.of(_marker),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: FloatingActionButton.extended(
                onPressed: ()async{
                  GoogleMapController controller = await _controller.future;
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                    const CameraPosition(
                        target: LatLng(34.175326, 71.859801),
                      zoom: 10.0
                    ),
                  ),
                  );
                  // getUserCurrentLocation().then((value)async{
                  //   print(value.latitude.toString() +" "+ value.longitude.toString());
                  //   _marker.add(
                  //     Marker(
                  //         markerId: MarkerId('2'),
                  //         position: LatLng(value.latitude, value.longitude),
                  //       infoWindow: InfoWindow(
                  //         title: 'Th is my Location',
                  //       ),
                  //     ),
                  //   );
                  //   CameraPosition cameraPosition = CameraPosition(
                  //     zoom: 24.0,
                  //       target: LatLng(value.latitude, value.longitude),
                  //   );
                  //   final GoogleMapController controller = await _controller.future;
                  //   controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                  //   setState(() {
                  //
                  //   });
                  // });

                },
                label: const Icon(Icons.add)),
          )
        ],
      )
    );
  }
  }
