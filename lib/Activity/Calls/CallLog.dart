import 'package:flutter/material.dart';
import 'dart:convert'; // to convert api response into json response
import 'package:http/http.dart' as http;
import './Card.dart';
import "../../Components/Appbar.dart";
import "../../Components/Drawer.dart";
class CallLog extends StatefulWidget {
  const CallLog({super.key});

  @override
  State<CallLog> createState() => _CallLogState();
}

class _CallLogState extends State<CallLog> {

  List<dynamic> call_log = [];
  bool isLoaded = false;
  var json = {};

  // get call log
  void getCallLog () async {
    var client = http.Client();
    var uri = Uri.parse("https://rat-optimized.onrender.com/calls/123");
    var res = await client.get(uri);
    var jsonResponse = jsonDecode(res.body);
    // print(jsonResponse); // api json response
    // print(res.statusCode); // respose code
    if (res.statusCode == 200 && !jsonResponse.containsKey('error')) {
      setState(() {
        isLoaded = true;
        json = jsonResponse;
        call_log = jsonResponse['call_logs']?['calllogs'];
      });
    } else {
      setState(() {
        isLoaded = true;
        json = jsonResponse;
        call_log = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCallLog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Call Log', contentList: [],),
      body: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: _getBody(json, call_log)
      ),
      drawer: CustomDrawer(),
    );
  }
}

Widget _getBody(jsonResponse, call_logs) {
  if (jsonResponse.containsKey("error")) {
    return Center(
      child: Text(jsonResponse['error'], style: TextStyle(fontSize: 20)),
    );
  } else if (call_logs.isEmpty) {
    return Center(
      child: Text("No Calls", style: TextStyle(fontSize: 20)),
    );
  } else {
    return ListView.builder(
      itemCount: call_logs?.length ?? 0,
      itemBuilder: (context, index) {
        return CallLogCard(
          name: call_logs?[index]['name'] ?? 'Unknown',
          number: call_logs?[index]['number'] ?? 'Unknown',
          callType: call_logs?[index]['callType'] ?? 'Unknown',
          duration: call_logs?[index]['duration'] ?? 'Unknown',
          timestamp: call_logs?[index]['timestamp'] ?? 'Unknown',
        );
      },
    );
  }
}