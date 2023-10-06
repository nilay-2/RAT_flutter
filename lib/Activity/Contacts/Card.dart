import 'package:flutter/material.dart';
import 'package:rat_be_project/Utils/DateTimeFormatter.dart';

class smsCard extends StatelessWidget {
  const smsCard({super.key, this.sender, this.message});

  final sender;
  final message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300] ??
                Colors.grey, // You can specify the border color here.
            // You can adjust the border width as needed.
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.webp'),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sender ?? 'Unknown',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: StrutStyle(fontSize: 12.0),
            maxLines: 2,
            text: TextSpan(
                style: TextStyle(color: Colors.grey[600]),
                text: message ?? 'Unknown'),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
