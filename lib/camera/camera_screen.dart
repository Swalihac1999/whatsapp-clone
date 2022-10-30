// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> Cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? CameraValue;
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(Cameras[index], ResolutionPreset.high);
    CameraValue = _cameraController.initialize();
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: CameraValue,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CircleAvatar(),
              Icon(
                Icons.panorama_fish_eye,
                size: 100,
              ),
              IconButton(
                icon: Icon(Icons.camera_alt_outlined),
                onPressed: () {
                  setState(() {
                    index = index == 0 ? 1 : 0;
                    _cameraController = CameraController(
                        Cameras[index], ResolutionPreset.ultraHigh);
                    CameraValue = _cameraController.initialize();
                  });
                },
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
