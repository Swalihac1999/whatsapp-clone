import 'package:flutter/material.dart';
import 'package:proto/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text('Screen 1'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) {
                      return screen2();
                      }));
              },
              child: Text('Go Back screen 2'))
        ],
      )),
    );
  }
}
