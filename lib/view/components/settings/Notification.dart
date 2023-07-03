import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:Text("About Us",style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),) ,
      ),
      body: Container(
        child: Column(
          children: [
            Icon(Icons.new_releases_outlined,color: Colors.brown,)
          ],

        ),
      )
    );

  }
}
