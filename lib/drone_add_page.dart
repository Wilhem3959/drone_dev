import 'package:flutter/material.dart';
import 'drone_list_view.dart';
import 'drone_scan_view.dart';
import 'drone_list_add.dart';
import 'drawer_header.dart';

class DroneAddPage extends StatefulWidget {
  const DroneAddPage({super.key});
  @override
  State<DroneAddPage> createState() => _DroneAddPageState();
}

class _DroneAddPageState extends State<DroneAddPage> {
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
          title: const Text('Autonomous Reconnaissance Drone'),
          backgroundColor: const Color(0xFF0437F2)),
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
                  Text("Drones Available", style: headingStyle),
                ],
              ),
              const Divider(
                thickness: null,
                color: Color(0xFF3D3D3D),
              ),
              const DroneListAdd(),
              const Divider(
                thickness: null,
                color: Color(0xFF3D3D3D),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Scaned Drones", style: headingStyle),
                ],
              ),
              const Divider(
                thickness: null,
                color: Color(0xFF3D3D3D),
              ),
              DroneScanView(),
              const Divider(
                thickness: null,
                color: Color(0xFF3D3D3D),
              ),
              ListTile(
                leading: const Icon(
                  Icons.add,
                  color: Colors.green,
                ),
                title: const Text('Add Drone Manually'),
                onTap: () async {
                  //get drone from text field
                  String? newDronen = await openDialog();
                  //String tryAgain = await openDialog() ?? "";
                  //need to add to both lists for add page and side bar
                  if (newDronen == null || newDronen.isEmpty) {
                  } else {
                    String? tryPass = await passDialog();
                    if (tryPass != null &&
                        tryPass.isNotEmpty &&
                        tryPass == '1234') {
                      //DroneListView.addDrone();
                      setState(() {
                        DroneListView.pullDrone(newDronen);
                        DroneListAdd.pullDrone(newDronen);
                      });
                    }
                  }
                },
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
              title: const Text('drone name'),
              content: TextField(
                autofocus: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Enter drone'),
                controller: controller,
              ),
              actions: [
                TextButton(
                  onPressed: submit,
                  child: const Text('Submit'),
                )
              ]));

  Future<String?> passDialog() => showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
              title: const Text('Password'),
              content: TextField(
                autofocus: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(hintText: 'Enter password'),
                controller: controller,
              ),
              actions: [
                TextButton(
                  onPressed: submit,
                  child: const Text('Submit'),
                )
              ]));
  void submit() {
    Navigator.of(context).pop(controller.text);

    controller.clear();
  }
}
