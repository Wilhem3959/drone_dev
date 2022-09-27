import 'package:drone_dev/mapDrawing.dart';
import 'package:drone_dev/map_live.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'drawer_header.dart';
import 'drone_list_view.dart';
import 'drone.dart';
import 'drone_add_page.dart';

class DroneListAdd extends StatefulWidget {
  DroneListAdd({super.key});
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
  late TextEditingController controller;

  String? get nameDrone => null;
  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                  onPressed: () async {
                    String? areSure = await delDialog();
                    var answer = areSure!.toLowerCase();
                    if (answer == 'yes' || answer == 'y') {
                      DroneListAdd.drones.removeAt(index);
                      DroneListView.drones.removeAt(index);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DroneAddPage()));
                      setState(() {});
                    }
                    //print("Drone ${DroneListAdd.drones[index].name} selected");
                    //Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => MapDrawing()));
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

  Future<String?> delDialog() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
              title: Text('Are you sure you want to Delete this Drone'),
              content: TextField(
                autofocus: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Enter Yes to proceed'),
                controller: controller,
              ),
              actions: [
                TextButton(
                  child: Text('Submit'),
                  onPressed: submit,
                )
              ]));
  void submit() {
    Navigator.of(context).pop(controller.text);

    controller.clear();
  }
}
