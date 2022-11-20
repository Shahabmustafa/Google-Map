import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_map/Screen/add_notifer.dart';

class ConvertLanLong extends StatefulWidget {
  const ConvertLanLong({Key? key}) : super(key: key);

  @override
  State<ConvertLanLong> createState() => _ConvertLanLongState();
}

class _ConvertLanLongState extends State<ConvertLanLong> {
  // String addressString = '';
  // String placeString = '';

  AddNotifer addNotifer = AddNotifer();

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              ValueListenableBuilder(
                  valueListenable: addNotifer.setdata,
                  builder: (context,builderNotifer,child){
                    return Text('Coordinate Your ${builderNotifer.toString()}');
                  }
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: ()async{
                      List<Location> location = await locationFromAddress('Gronausestraat 710, Enschede');
                      addNotifer.setAddNotifer(location.first.latitude.toString() + ' ' + location.first.longitude.toString());
                    },
                    child: Text('Add'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: ()async{
                      List<Placemark> placemark = await placemarkFromCoordinates(34.1612, 71.8453);
                      addNotifer.setAddNotifer(placemark.first.toString());
                    },
                    child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
