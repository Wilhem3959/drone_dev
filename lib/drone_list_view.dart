import 'package:drone_dev/mapDrawing.dart';
import 'package:drone_dev/map_live.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'drone.dart';

class DroneListView extends StatefulWidget {
  DroneListView({super.key});

  static List<Drone> drones = [];

  @override
  State<DroneListView> createState() => _DroneListViewState();

  static void addDrone() {
    drones.add(Drone(name: _randomString(20)));
  }

  static String _randomString(int length) {
    var rand = Random();
    var codeUnits = List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });
    return String.fromCharCodes(codeUnits);
  }
}
///////////////////////////////////////////////

class _DroneListViewState extends State<DroneListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 1),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const Divider(
        thickness: null,
        color: Color(0xFF3D3D3D),
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.zero,
          child: Container(
            height: 50,
            color: const Color(0x0000ffff),
            child: Center(
              child: Expanded(
                child: TextButton(
                  onPressed: () {
                    print("Drone ${DroneListView.drones[index].name} selected");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapDrawing()));
                  },
                  child: Text(
                    DroneListView.drones[index].name,
                    style: TextStyle(color: Colors.white),
                  ),
                  //style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: DroneListView.drones.length,
    );
  }
}
