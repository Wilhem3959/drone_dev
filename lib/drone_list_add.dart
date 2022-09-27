import 'package:drone_dev/mapDrawing.dart';
import 'package:drone_dev/map_live.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'drawer_header.dart';

import 'drone.dart';

class DroneListAdd extends StatefulWidget {
  DroneListAdd({super.key});
  static List<Drone> drones = [];
  @override
  State<DroneListAdd> createState() => _DroneListAddState();

  static void addDrone() {
    drones.add(Drone(name: _randomString(20)));
  }

  static void test(String j) {
    drones.add(Drone(name: j));
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

class _DroneListAddState extends State<DroneListAdd> {
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
                    print("Drone ${DroneListAdd.drones[index].name} selected");
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapDrawing()));
                  },
                  child: Text(
                    DroneListAdd.drones[index].name,
                    style: TextStyle(color: Color.fromARGB(255, 63, 22, 211)),
                    // Color.fromARGB(255, 30, 0, 139)),
                  ),
                  //style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: DroneListAdd.drones.length,
    );
  }
}
