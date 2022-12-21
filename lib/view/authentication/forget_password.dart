import 'package:flutter/material.dart';

class forget_password extends StatefulWidget {
  const forget_password({Key? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image(
            image: AssetImage('assets/images/forget.jpeg'),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              '',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
