import 'package:drone_dev/drone_add_page.dart';
import 'package:flutter/material.dart';
import 'drone_list_view.dart';
import 'drone_manage_page.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      backgroundColor: const Color(0xFF3D3D3D),
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
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 3,
            color: Color(0xFFA9A9A9),
          ),
          const DroneListView(),
          const Divider(
            thickness: 3,
            color: Color(0xFFA9A9A9),
          ),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.white),
            textColor: Colors.white,
            title: const Text('Add Drone'),
            onTap: () {
              //setState(() {
              //  DroneListView.addDrone();
              //  //droneListView.addDrone();
              // });
              //changed that when add drone is pressed it takes the user to add drone page and will no longer just add a random drone
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DroneAddPage()));
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapLive()),
                
              );
              */
            },
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts, color: Colors.white),
            textColor: Colors.white,
            title: const Text('Manage Drone'),
            onTap: () {
              // Update the state of the app
              // ...
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DroneManagePage()));
              // Then close the drawer
              //Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('App Settings'),
            textColor: Colors.white,
            leading: const Icon(Icons.settings, color: Colors.white),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
