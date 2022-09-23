import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'drawer_header.dart';

void main() {
  // Add these 2 lines
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  // Then call runApp() as normal
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Autonomous Reconnaissance Drone';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(title), backgroundColor: const Color(0xFF0437F2)),
      body: Center(
        child: Image.asset('assets/images/airforce_logo.png',
            width: 500, height: 500),
      ),
      drawer: const HeaderDrawer(),
    );
  }
}
