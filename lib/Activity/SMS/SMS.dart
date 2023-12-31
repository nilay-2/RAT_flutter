import 'dart:convert'; // to convert api response into json response
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // to make http requests
import "./Card.dart";
import "../../Components/Appbar.dart";
import "../../Components/Drawer.dart";
class SMS extends StatefulWidget {
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  List<dynamic> sms_list = [];
  var json = {};
  bool isLoaded = false;

  // api call
  void getSMS() async {
    try {
      var client = http.Client();
      var uri = Uri.parse("https://rat-optimized.onrender.com/sms/123");
      var res = await client.get(uri);
      var jsonResponse = jsonDecode(res.body);
      // print(jsonResponse.toString()); // api json response
      // print(res.statusCode); // response code
      if (res.statusCode == 200 && !jsonResponse.containsKey('error')) {
        setState(() {
          isLoaded = true;
          json = jsonResponse;
          sms_list = jsonResponse['sms']?['inbox'];
        });
      } else {
        setState(() {
          isLoaded = true;
          json = jsonResponse;
          sms_list = [];
        });
      }
    } catch(error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    getSMS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: GlobalKey<ScaffoldState>(),
      appBar: CustomAppbar(title: "Messages", contentList: sms_list),
      body: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: _getBody(json, sms_list)
      ),
      drawer: CustomDrawer(),
    );
  }
}

Widget _getBody(jsonResponse, sms_list) {
  if (jsonResponse.containsKey("error")) {
    return Center(
      child: Text(jsonResponse['error'], style: TextStyle(fontSize: 20)),
    );
  } else if (sms_list.isEmpty) {
    return Center(
      child: Text("No messages", style: TextStyle(fontSize: 20)),
    );
  } else {
    return ListView.builder(
      itemCount: sms_list?.length ?? 0,
      itemBuilder: (context, index) {
        return smsCard(
          sender: sms_list?[index]['sender'] ?? 'Unknown',
          date: sms_list?[index]['date'] ?? 'Unknown',
          message: sms_list?[index]['body'] ?? 'Unknown',
        );
      },
    );
  }
}

