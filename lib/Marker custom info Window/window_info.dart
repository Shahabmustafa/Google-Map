import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';

class MarkerCustom extends StatefulWidget {
  const MarkerCustom({Key? key}) : super(key: key);

  @override
  State<MarkerCustom> createState() => _MarkerCustomState();
}

class _MarkerCustomState extends State<MarkerCustom> {

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latlng = <LatLng>[
    LatLng(34.175330, 71.859783),
    LatLng(34.176661, 71.866949),
    LatLng(34.176408, 71.866227),
    LatLng(34.176263, 71.865985),
    LatLng(34.176083, 71.865301),
    LatLng(34.175953, 71.864880),
  ];

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
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: _latlng[i],
          onTap: (){
            _customInfoWindowController.addInfoWindow!(
              Container(
                width: 200.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW_CeO5YPV3_A5znkG_6nOclWW1jOfg78txQ&usqp=CAU'),
                          fit: BoxFit.cover,
                          // filterQuality: 
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text("Shahab Mustafa"),
                              SizedBox(
                                width: 100.0,
                              ),
                              Text('3 ml'),
                            ],
                          ),
                          Row(
                            children: [

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _latlng[i],
            );
          }
        ),
      );
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(34.175953, 71.864880),
              zoom: 14.0
          ),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: Set<Marker>.of(_markers),
            onTap: (postition){
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (postition){
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller){
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
              controller: _customInfoWindowController,
            width: 250.0,
            height: 180.0,
            offset: 35,
          ),
        ],
      ),
    );
  }
}
