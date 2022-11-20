import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GoogleSearchApi extends StatefulWidget {
  const GoogleSearchApi({Key? key}) : super(key: key);

  @override
  State<GoogleSearchApi> createState() => _GoogleSearchApiState();
}

class _GoogleSearchApiState extends State<GoogleSearchApi> {

  TextEditingController _controller = TextEditingController();

  var uuid = Uuid();
  String _sessionToken = '12345';
  List<dynamic> _placeList = [];

  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggection(_controller.text);
  }

  void getSuggection(String input)async{
    String Place_API_KEY = 'AIzaSyAHBCHZfGMvk1ItnfOw_btkQFkVnacokeE';
    String baseUrl = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseUrl?input=$input&key=$Place_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));
    print(response.body.toString());
    if(response.statusCode == 200){
      setState(() {
        _placeList = jsonDecode(response.body.toString())['predictions'];
      });
    }else{
      throw Exception('Failed to lead data');
    }

  }

  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Search Api'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Search Place Name'
            ),
          ),
        ],
      )
    );
  }
}

