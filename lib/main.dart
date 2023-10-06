import 'package:flutter/material.dart';
import 'Activity/SMS/SMS.dart';
import "Activity/Calls/CallLog.dart";
import "Activity/InstalledApps/InstalledApp.dart";
import 'Activity/Contacts/Contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Monitor Activity'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  // add screens over here.
  final screens = [SMS(), CallLog(), InstalledApps(), Contacts(), Contacts()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) => setState(() {
              this.index = index;
            }),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.sms_rounded), label: 'SMS'),
              NavigationDestination(icon: Icon(Icons.call), label: 'Calls'),
              NavigationDestination(
                  icon: Icon(Icons.install_mobile_sharp), label: 'Apps'),
              NavigationDestination(
                  icon: Icon(Icons.contacts), label: 'Contacts'),
              NavigationDestination(
                  icon: Icon(Icons.location_on), label: 'Location'),
            ],
          ),
        ),
        body: screens[index]);
  }
}
