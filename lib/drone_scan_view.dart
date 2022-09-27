import 'package:drone_dev/mapDrawing.dart';
import 'package:drone_dev/map_live.dart';
import 'package:flutter/material.dart';
import 'drone_list_view.dart';
import 'drone_list_add.dart';
import 'drone_add_page.dart';
import 'dart:math';

import '../drone.dart';

//created a new DroneListView to show a random list to be a scanning list
class DroneScanView extends StatefulWidget {
  DroneScanView({super.key}) {
    //run this so a list shows when you first open the add drone page
    DroneScanView.addDrone();
  }
  //list of fake drones
  static List<Drone> dronesF = [];
  @override
  State<DroneScanView> createState() => _DroneScanViewState();

  //create a random list of drones that can be added
  static void addDrone() {
    dronesF.clear();
    dronesF.add(Drone(name: _randomString(20)));
    dronesF.add(Drone(name: _randomString(20)));
    dronesF.add(Drone(name: _randomString(20)));
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

class _DroneScanViewState extends State<DroneScanView> {
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
                    String tHelp = DroneScanView.dronesF[index].name;
                    //DroneListView.addDrone();
                    setState(() {
                      //add drone from scan list to both viewing list, add page and the side bar
                      DroneListView.pullDrone(tHelp);
                      DroneListAdd.test(tHelp);
                    });
                    //force refresh for the page
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DroneAddPage()));
                    setState(() {});
                    //DroneListAdd.addDrone();
                  },

                  child: Text(
                    DroneScanView.dronesF[index].name,
                    style: TextStyle(color: Color.fromARGB(255, 30, 0, 139)),
                  ),
                  //style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: DroneScanView.dronesF.length,
    );
  }
}
