import "package:flutter/material.dart";
import "package:rat_be_project/Utils/ConvertTimeStampToDate.dart";
class CallLogDetail extends StatelessWidget {
  const CallLogDetail(
      {super.key,
      this.name,
      this.number,
      this.duration,
      this.callType,
      this.timestamp});

  final name, number, duration, callType, timestamp;

  String getDuration(String duration) {
    int seconds = int.tryParse(duration) ?? 0;
    
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    // Format the result as "hh:mm:ss"
    String formattedTime = '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        elevation: 1,
        title: Row(
          children: [
            SizedBox(
              width: 80,
            ),
            Text(
              'Call Details' ?? "Not available",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.webp'),
                      radius: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(name != 'null' ? name : number, style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date: '
                        , style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),),
                        Text(convertTimeStamp(timestamp, 'Date') , style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ))
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time: '
                            , style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        )),
                        Text(convertTimeStamp(timestamp, 'DateTime').substring(10), style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ))
                      ],
                    ),Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Duration: '
                            , style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        )),
                        Text("${getDuration(duration)}", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
