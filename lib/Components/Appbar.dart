import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key, required this.title, this.contentList = const []});

  final String title;
  final List<dynamic> contentList;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[850],
      centerTitle: true,
      toolbarHeight: 50,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(Icons.menu, color: Colors.white,),
      ),
      title: Text(
          "${title} ${contentList != null && contentList!.length > 0 ? "(${contentList?.length})" : ''}",
          style: TextStyle(color: Colors.white), // Your page content
        ),

    );
    ;
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
