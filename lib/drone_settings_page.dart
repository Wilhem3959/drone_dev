import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'drawer_header.dart';

void main() {
  runApp(
    const DroneSettingsPage(),
  );
}

class DroneSettingsPage extends StatefulWidget {
  const DroneSettingsPage({Key? key}) : super(key: key);

  @override
  State<DroneSettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<DroneSettingsPage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0437F2));

  bool lockAppSwitchVal = true;
  bool fingerprintSwitchVal = false;
  bool changePassSwitchVal = true;

  TextStyle headingStyleIOS = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: CupertinoColors.inactiveGray,
  );
  TextStyle descStyleIOS = const TextStyle(color: CupertinoColors.inactiveGray);

  get child => null;

  @override
  Widget build(BuildContext context) {
    String title;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF0437F2),
            secondary: const Color(0xFFD4AF37),
            background: Colors.white),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Drone: Name of drone settings")),
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
                    Text("Sensors", style: headingStyle),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.phonelink_lock_outlined),
                  title: const Text("EID Detection sensor"),
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
                  leading: const Icon(Icons.fingerprint),
                  title: const Text("Radio Jammer"),
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
                  leading: const Icon(Icons.lock),
                  title: const Text("Electronic magnetic pulse"),
                  trailing: Switch(
                      value: changePassSwitchVal,
                      activeColor: const Color(0xFFD4AF37),
                      onChanged: (val) {
                        setState(() {
                          changePassSwitchVal = val;
                        });
                      }),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Schedule", style: headingStyle),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text("${selectedTime.hour}:${selectedTime.minute}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _selectTime(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!),
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
