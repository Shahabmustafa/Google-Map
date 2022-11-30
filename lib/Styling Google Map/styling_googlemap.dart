import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StylingGoogleMap extends StatefulWidget {
  const StylingGoogleMap({Key? key}) : super(key: key);

  @override
  State<StylingGoogleMap> createState() => _StylingGoogleMapState();
}
  String mapTheme = '';
class _StylingGoogleMapState extends State<StylingGoogleMap> {
  final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition _cameraPosition = CameraPosition(target: LatLng(34.175330, 71.859783));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DefaultAssetBundle.of(context).loadString('assets/maptheme/silver_theme.json').then((value){
      mapTheme = value;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Style'),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(
              onTap: (){
                _controller.future.then((value){
                  DefaultAssetBundle.of(context).loadString('assets/maptheme/silver_theme.json').then((String){
                    value.setMapStyle(String);
                  });
                });
              },
                child: Text('Silver')),
            PopupMenuItem(
                onTap: (){
                  _controller.future.then((value){
                    DefaultAssetBundle.of(context).loadString('assets/maptheme/dark_theme.json').then((String){
                      value.setMapStyle(String);
                    });
                  });
                },
                child: Text('Dark')),
            PopupMenuItem(
                onTap: (){
                  _controller.future.then((value){
                    DefaultAssetBundle.of(context).loadString('assets/maptheme/night_theme.json').then((String){
                      value.setMapStyle(String);
                    });
                  });
                },
                child: Text('Night')),
            PopupMenuItem(
                onTap: (){
                  _controller.future.then((value){
                    DefaultAssetBundle.of(context).loadString('assets/maptheme/retro_theme.json').then((String){
                      value.setMapStyle(String);
                    });
                  });
                },
                child: Text('Retro')),
            PopupMenuItem(
                onTap: (){
                  _controller.future.then((value){
                    DefaultAssetBundle.of(context).loadString('assets/maptheme/aubergine_theme.json').then((String){
                      value.setMapStyle(String);
                    });
                  });
                },
                child: Text('Aubergine')),
            PopupMenuItem(
                onTap: (){
                  _controller.future.then((value){
                    DefaultAssetBundle.of(context).loadString('assets/maptheme/standard_theme.json').then((String){
                      value.setMapStyle(String);
                    });
                  });
                },
                child: Text('Standard')),
          ]),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        onMapCreated: (GoogleMapController controller){
          controller.setMapStyle(mapTheme);
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
