import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueAccent,
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: DrawerHeader(child:
                Text('Activity', style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                ),),
              ),
            ),
            ListTile(
              leading: Icon(Icons.auto_graph_rounded, color: Colors.white54,
              size: 30),
              title: Text("App usage", style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
              onTap: () {
                print("Hello world");
              },
            )
          ],
        ),
      ),
    );
  }
}
