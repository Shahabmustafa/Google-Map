import 'package:flutter/material.dart';
import 'package:google_map/Draw%20PolyLine/poly_line.dart';
import 'package:google_map/Draw%20Polygon/draw_polygon.dart';
import 'package:google_map/Exmple/example_page.dart';
import 'package:google_map/Multiple%20Customer%20Marker/multiple_marker.dart';
import 'package:google_map/Screen/home_page.dart';
import 'package:google_map/Styling%20Google%20Map/styling_googlemap.dart';
import 'package:google_map/google_search_api/google_search.dart';

import 'Marker custom info Window/window_info.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StylingGoogleMap(),
    );
  }
}