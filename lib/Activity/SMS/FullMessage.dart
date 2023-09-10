import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rat_be_project/Utils/DateTimeFormatter.dart';
class FullText extends StatelessWidget {
  const FullText({super.key, this.sender, this.message, this.date});
  final String? sender, message;
  final date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 255, 1),
      appBar: AppBar(
        leading: BackButton(),
        elevation: 1,
        title: Row(
          children: [
            SizedBox(
              width: 80,
            ),
            Text(sender ?? "Not available", style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(formatTimestamp(date, "DateTime") ?? "Date: NA", style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500
                ),),
              ),
            ),
            Card(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(message ?? "Message not available...", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                )),
              ),
            ),
          ],
        ),
      )
    );
  }
}
