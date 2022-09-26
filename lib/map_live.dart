import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';
import 'drone_settings_drawer.dart';
import 'map.dart';

class MapLive extends StatefulWidget {
  const MapLive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapLiveState createState() => _MapLiveState();
}

class _MapLiveState extends State<MapLive> {
  get mainAxisAlignment => null;

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Autonomous Reconnaissance Drone'),
                backgroundColor: const Color(0xFF0437F2)),
            drawer: const HeaderDrawer(),
            endDrawer: const EndDrawer(),
            body: Align(
              alignment: Alignment.topLeft,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(children: [
                    Container(
                      width: constraints.maxWidth / 2,
                      height: constraints.maxHeight,
                      color: Colors.red,
                      alignment: Alignment.topRight,
                      child: const MapScreen(),
                    ),
                    Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth / 2,
                        child: controller == null
                            ? const Center(child: Text("Loading Camera..."))
                            : !controller!.value.isInitialized
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CameraPreview(controller!)),
                  ]);
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.assistant_direction),
                label: 'New Route',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assistant_direction_sharp),
                label: 'Previous Route',
              )
            ])));
  }
}
