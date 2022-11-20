import 'package:flutter/material.dart';
import 'package:google_map/Exmple/example_page.dart';
import 'package:google_map/Multiple%20Customer%20Marker/multiple_marker.dart';
import 'package:google_map/Screen/home_page.dart';
import 'package:google_map/google_search_api/google_search.dart';

import 'Screen/convert_lanlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultipleMarker(),
    );
  }
}