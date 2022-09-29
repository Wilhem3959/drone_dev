// a page that is to add a drone to our current list of drones
import 'package:flutter/material.dart';
import 'drawer_header.dart';
import 'drone_list_manage.dart';
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
  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0437F2));

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
        title: Text('Autonomous Reconnaissance Drone'),
        backgroundColor: const Color(0xFF0437F2),
      ),
      drawer: const HeaderDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Manage Drones", style: headingStyle),
                ],
              ),
              const Divider(
                thickness: null,
                color: Color(0xFF3D3D3D),
              ),
              DroneListManage(),
              const Divider(
                thickness: null,
                color: Color(0xFF3D3D3D),
              ),
            ],
          ),
        ),
      ),
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
