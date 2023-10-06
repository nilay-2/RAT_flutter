import 'dart:convert'; // to convert api response into json response
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // to make http requests
import "./Card.dart";

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactState();
}

class _ContactState extends State<Contacts> {
  List<dynamic> sms_list = [];
  var json = {};
  bool isLoaded = false;

  // api call
  void getSMS() async {
    try {
      var client = http.Client();
      var uri = Uri.parse("https://rat-optimized.onrender.com/contacts/123");
      var res = await client.get(uri);
      var jsonResponse = jsonDecode(res.body);
      // print(jsonResponse.toString()); // api json response
      // print(res.statusCode); // response code
      if (res.statusCode == 200 && !jsonResponse.containsKey('error')) {
        setState(() {
          isLoaded = true;
          json = jsonResponse;
          sms_list = jsonResponse['contacts']?['contacts'];
        });
      } else {
        setState(() {
          isLoaded = true;
          json = jsonResponse;
          sms_list = [];
        });
      }
    } catch (error) {
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
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        toolbarHeight: 50,
        title: Center(
          child: Text(
            "Contacts ${sms_list != null && sms_list!.length > 0 ? "(${sms_list?.length})" : ''}",
            style: TextStyle(color: Colors.white), // Your page content
          ),
        ),
      ),
      body: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: _getBody(json, sms_list)),
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
      child: Text("No Contacts", style: TextStyle(fontSize: 20)),
    );
  } else {
    return ListView.builder(
      itemCount: sms_list?.length ?? 0,
      itemBuilder: (context, index) {
        return smsCard(
          sender: sms_list?[index]['name'] ?? 'Unknown',
          message: sms_list?[index]['contact'][0] ?? 'Unknown',
        );
      },
    );
  }
}
