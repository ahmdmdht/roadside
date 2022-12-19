
import 'package:flutter/material.dart';
import 'package:roadside_assistance/view/authentication/splash_screen.dart';
import 'package:roadside_assistance/view/components/home_screen.dart';


void main() {
  //باخد instance من المكتبة اوبسيرفر عشان ي check ع اربع وهما
  // 1 on create
  // 2 on change لما بتغير من state to another
  // 3 on error
  // 4 on close

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'roadside assistance',

      theme: ThemeData(


      ),
      debugShowCheckedModeBanner: false,
      home: home_screen(),

    );
  }
}





