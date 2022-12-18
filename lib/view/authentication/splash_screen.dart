import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';


import 'on_boarding.dart';
class splashscreen extends StatelessWidget {
  const splashscreen({Key? key}) : super(key: key);

  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  //  print('aaaaaaaaaaaaaaaaaaa7aaa');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset("assets/images/splashScreen.jpeg",fit: BoxFit.cover,),
        splashIconSize: double.infinity,
        nextScreen:  on_boarding(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,

      ),

    );
  }
}
