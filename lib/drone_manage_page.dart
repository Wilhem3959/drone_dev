// a page that is to add a drone to our current list of drones
import 'package:flutter/material.dart';
import 'drone_list_view.dart';
import 'drone_scan_view.dart';
import 'drone_list_add.dart';
import 'drawer_header.dart';
import 'drone_list_manage.dart';
import 'dart:io';
import 'dart:math';
import 'drone.dart';

//looks like a add wifi page
//scan for drones or add manual drone
//List<Drone> dronesF = [];

class DroneManagePage extends StatefulWidget {
  const DroneManagePage({super.key});
  @override
  State<DroneManagePage> createState() => _DroneManagePageState();
}

class _DroneManagePageState extends State<DroneManagePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Drones(remove Drones)'),
        backgroundColor: const Color(0xFF0437F2),
      ),
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
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            DroneListManage(),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
      drawer: const HeaderDrawer(),
    );
  }

  Future<String?> openDialog() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
              title: Text('drone name'),
              content: TextField(
                autofocus: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Enter drone'),
                controller: controller,
              ),
              actions: [
                TextButton(
                  child: Text('Submit'),
                  onPressed: submit,
                )
              ]));

  Future<String?> passDialog() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
              title: Text('Password'),
              content: TextField(
                autofocus: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Enter password'),
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
