import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EndDrawerState createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      backgroundColor: const Color(0xFF3D3D3D),
      child: Column(
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
                  " Drones Settings",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(MdiIcons.bomb, color: Colors.white),
            title: const Text("EID Detection sensor"),
            textColor: Colors.white,
            trailing: Switch(
                value: lockAppSwitchVal,
                activeColor: const Color(0xFFD4AF37),
                onChanged: (val) {
                  setState(() {
                    lockAppSwitchVal = val;
                  });
                }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(MdiIcons.accessPointOff, color: Colors.white),
            title: const Text("Radio Jammer"),
            textColor: Colors.white,
            trailing: Switch(
                value: fingerprintSwitchVal,
                activeColor: const Color(0xFFD4AF37),
                onChanged: (val) {
                  setState(() {
                    fingerprintSwitchVal = val;
                  });
                }),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.bolt, color: Colors.white),
            title: const Text("Electronic magnetic pulse"),
            textColor: Colors.white,
            trailing: Switch(
                value: changePassSwitchVal,
                activeColor: const Color(0xFFD4AF37),
                onChanged: (val) {
                  setState(() {
                    changePassSwitchVal = val;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
