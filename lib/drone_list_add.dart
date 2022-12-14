import 'package:drone_dev/map_drawing.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'drone.dart';

class DroneListAdd extends StatefulWidget {
  const DroneListAdd({super.key});
  static List<Drone> drones = [];
  @override
  State<DroneListAdd> createState() => _DroneListAddState();

  static void addDrone() {
    drones.add(Drone(name: _randomString(20)));
  }

  static void pullDrone(String nameDrone) {
    drones.add(Drone(name: nameDrone));
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
              child: Row(children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MapDrawing()));
                      //String? areSure = await delDialog();
                      //var answer = areSure!.toLowerCase();
                      //if (answer == 'yes' || answer == 'y') {
                      //  DroneListAdd.drones.removeAt(index);
                      //  DroneListView.drones.removeAt(index);
                      //  Navigator.of(context).push(MaterialPageRoute(
                      //      builder: (context) => DroneAddPage()));
                      //  setState(() {});
                      //}
                      //print("Drone ${DroneListAdd.drones[index].name} selected");
                      //Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => MapDrawing()));
                    },
                    child: Text(
                      DroneListAdd.drones[index].name,
                      style: const TextStyle(color: Colors.black),
                      // Color.fromARGB(255, 30, 0, 139)),
                    ),
                    //style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
      itemCount: DroneListAdd.drones.length,
    );
  }
}
