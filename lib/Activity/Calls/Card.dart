import 'package:flutter/material.dart';
import "package:rat_be_project/Utils/DateTimeFormatter.dart";
import "package:rat_be_project/Utils/ConvertTimeStampToDate.dart";
import "./Call_detail.dart";

class CallLogCard extends StatelessWidget {
  const CallLogCard(
      {super.key,
      this.name,
      this.number,
      this.callType,
      this.duration,
      this.timestamp});

  final name, number, callType, duration, timestamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300] ?? Colors.grey,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: ListTile(
          leading: getLeadingIcon(callType),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name != 'null' ? name ?? 'Unknown' : number,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                convertTimeStamp(timestamp, 'Date'),
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          subtitle: name != 'null'
              ? RichText(
                  overflow: TextOverflow.ellipsis,
                  strutStyle: StrutStyle(fontSize: 12.0),
                  maxLines: 2,
                  text: TextSpan(
                      style: TextStyle(color: Colors.grey[600]), text: number),
                )
              : Text(""),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CallLogDetail(
                        name: name,
                        number: number,
                        timestamp: timestamp,
                        duration: duration,
                        callType: callType,
                      )),
            );
          },
        ),
      ),
    );
  }
}

Widget getLeadingIcon(callType) {
  var arr = callType.split('.');
  if (arr[1] == "outgoing") {
    return const Icon(
      Icons.phone_forwarded_rounded,
      color: Colors.grey,
    );
  } else if (arr[1] == 'incoming') {
    return const Icon(
      Icons.phone_callback_rounded,
      color: Colors.grey,
    );
  } else if (arr[1] == 'missing') {
    return const Icon(
      Icons.phone_missed_rounded,
      color: Colors.grey,
    );
  } else {
    return const Icon(
      Icons.phone,
      color: Colors.grey,
    );
  }
}
