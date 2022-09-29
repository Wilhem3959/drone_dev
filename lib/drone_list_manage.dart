import 'package:flutter/material.dart';
import 'drone_list_view.dart';
import 'drone.dart';
import 'drone_manage_page.dart';
import 'drone_list_add.dart';

class DroneListManage extends StatefulWidget {
  DroneListManage({super.key});
  static List<Drone> drones = [];
  @override
  State<DroneListManage> createState() => _DroneListManageState();

  static void pullDrone(String nameDrone) {
    drones.add(Drone(name: nameDrone));
  }
}
///////////////////////////////////////////////

class _DroneListManageState extends State<DroneListManage> {
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
                      DroneListManage.drones.removeAt(index);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DroneManagePage()));
                      setState(() {});
                    }
                    //print("Drone ${DroneListAdd.drones[index].name} selected");
                    //Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => MapDrawing()));
                  },
                  child: Text(
                    DroneListManage.drones[index].name,
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
      itemCount: DroneListManage.drones.length,
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
