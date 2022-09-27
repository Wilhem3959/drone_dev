// a page that is to add a drone to our current list of drones
import 'package:flutter/material.dart';
import 'drone_list_view.dart';
import 'drone_scan_view.dart';
import 'drone_list_add.dart';
import 'drawer_header.dart';
import 'dart:io';
import 'dart:math';
import 'drone.dart';

//looks like a add wifi page
//scan for drones or add manual drone
//List<Drone> dronesF = [];

class DroneAddPage extends StatefulWidget {
  const DroneAddPage({super.key});
  @override
  State<DroneAddPage> createState() => _DroneAddPageState();
}

class _DroneAddPageState extends State<DroneAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add Drone'),
          backgroundColor: Color.fromARGB(255, 242, 4, 4)),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.only(right: 20, left: 20),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              color: const Color(0x0000ffff),
              width: double.infinity,
              height: 70,
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    " Drones Available",
                    style: TextStyle(
                        color: Color.fromARGB(255, 20, 3, 247), fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.add, color: Color.fromARGB(255, 255, 0, 0)),
              textColor: Color.fromARGB(255, 62, 2, 230),
              title: const Text('Scan for Drone'),
              onTap: () {
                setState(() {
                  //update the scan list
                  DroneScanView.addDrone();
                });
              },
            ),
            DroneScanView(),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            DroneListAdd(),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            ListTile(
              leading:
                  const Icon(Icons.add, color: Color.fromARGB(255, 255, 0, 0)),
              textColor: Color.fromARGB(255, 62, 2, 230),
              title: const Text('Add Drone'),
              onTap: () {
                setState(() {
                  //need to add to both lists for add page and side bar
                  DroneListView.addDrone();
                  DroneListAdd.addDrone();
                });
              },
            ),
          ],
        ),
      ),
      drawer: const HeaderDrawer(),
    );
  }
}
