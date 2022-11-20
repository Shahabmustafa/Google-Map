import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.grey,
                width: double.infinity,
                height: 200.0,
              ),
              Positioned(
                left: 160,
                bottom: -50,
                // height: 122,
                child: Container(
                    child: CircleAvatar(
                      radius: 50.0,
                    ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
