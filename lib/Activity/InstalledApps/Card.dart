import "package:flutter/material.dart";

class AppCard extends StatelessWidget {
  const AppCard({super.key, this.packageName, this.appName});
  final packageName, appName;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
          leading: AppIcon(packageName),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appName?? 'Unknown',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

            ],
          ),
          subtitle:Text(
            packageName?? 'Unknown',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),

        ),
      ),
    );
  }
}

Widget AppIcon(packageName) {
  return CircleAvatar(
    backgroundImage: AssetImage('assets/images/android.png'),
  );
}
