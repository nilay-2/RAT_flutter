import "package:flutter/material.dart";
import 'package:http/http.dart' as http; // to make http requests
import 'dart:convert'; // to convert api response into json response
import "./Card.dart";
class InstalledApps extends StatefulWidget {
  const InstalledApps({super.key});


  @override
  State<InstalledApps> createState() => _InstalledAppsState();
}

class _InstalledAppsState extends State<InstalledApps> {
  List<dynamic> installedApps = [];
  var json = {};
  bool isLoaded = false;

  // api call
  void getInstalledApps() async {
    var client = http.Client();
    var uri = Uri.parse("https://rat-optimized.onrender.com/installed-apps/123");
    var res = await client.get(uri);
    var jsonResponse = jsonDecode(res.body);
    print(jsonResponse); // api json response
    // print(res.statusCode); // respose code
    if (res.statusCode == 200 && !jsonResponse.containsKey('error')) {
      setState(() {
        isLoaded = true;
        json = jsonResponse;
        installedApps = jsonResponse['apps']?['installed-apps'];
      });
    } else {
      setState(() {
        isLoaded = true;
        json = jsonResponse;
        installedApps = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print("hello worlld");
    getInstalledApps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        toolbarHeight: 50,
        title: Center(
          child: Text(
            "Installed apps ${installedApps != null && installedApps!.length > 0 ? "(${installedApps?.length})" : ''}",
            style: TextStyle(color: Colors.white), // Your page content
          ),
        ),
      ),
      body: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: _getBody(json, installedApps)
      ),
    );
  }
}


Widget _getBody(jsonResponse, installedApps) {
  if (jsonResponse.containsKey("error")) {
    return Center(
      child: Text(jsonResponse['error'], style: TextStyle(fontSize: 20)),
    );
  } else if (installedApps.isEmpty) {
    return Center(
      child: Text("No Installed apps", style: TextStyle(fontSize: 20)),
    );
  } else {
    return ListView.builder(
      itemCount: installedApps?.length ?? 0,
      itemBuilder: (context, index) {
        return AppCard(
          packageName: installedApps?[index]['package-name'] ?? 'Unknown',
          appName: installedApps?[index]['app-name'] ?? 'Unknown',
        );
      },
    );
  }
}
