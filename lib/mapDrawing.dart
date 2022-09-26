// ignore: file_names
import 'package:drone_dev/drone_settings_page.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';
import 'drone_settings_drawer.dart';
import 'map.dart';
import 'package:drone_dev/main.dart';

class MapDrawing extends StatefulWidget {
  const MapDrawing({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapDrawingState createState() => _MapDrawingState();
}

class _MapDrawingState extends State<MapDrawing> {
  get mainAxisAlignment => null;

  @override
  void initState() {
    super.initState();
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
                return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  color: Colors.red,
                  alignment: Alignment.topRight,
                  child: const MapScreen(),
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.assistant_direction),
                  label: 'Next',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assistant_direction_sharp),
                  label: 'Previous Route',
                )
              ],
              onTap: (int index) {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DroneSettingsPage()), //This will go to the settings
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyApp()), //This will go to the split map
                  );
                }
              })
          //This would lead to
          ),
    );
  }
}
