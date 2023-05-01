
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:roadside_assistance/remote/cashe_helper.dart';
import 'package:roadside_assistance/view/Details.dart';
import 'package:roadside_assistance/view/authentication/car_information.dart';
import 'package:roadside_assistance/view/authentication/forget_password.dart';
import 'package:roadside_assistance/view/authentication/login.dart';
import 'package:roadside_assistance/view/authentication/signUp.dart';
import 'package:roadside_assistance/view/authentication/splash_screen.dart';
import 'package:roadside_assistance/view/authentication/verification.dart';
import 'package:roadside_assistance/view/components/settings/account_setting.dart';
import 'package:roadside_assistance/view/components/settings/setting1.dart';
import 'package:roadside_assistance/view/components/settings/setting_design.dart';
import 'package:roadside_assistance/view/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



import 'view/location/maps_Screen.dart';

DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users');
Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


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
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: splashscreen(),

    );
  }
}





