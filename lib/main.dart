import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadside_assistance/remote/cashe_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:roadside_assistance/repository/maps_repo.dart';
import 'package:roadside_assistance/view/authentication/splash_screen.dart';
import 'package:roadside_assistance/view/location/configMaps.dart';
import 'package:roadside_assistance/webservices/PlacesWebservices.dart';
import 'cubit/maps_cubit.dart';
import 'firebase_options.dart';
DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users');
//بعمل اوبجكت للناس الاونلاين فالفاير بيز
DatabaseReference rideRequestRef = FirebaseDatabase.instance.ref().child('users').child(currentfirebaseUser!.uid).child('newRide');
//DatabaseReference onlineOrOfflineUserRef = FirebaseDatabase.instance.ref().child('users').child(currentfirebaseUser!.uid).child(path);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
currentfirebaseUser = FirebaseAuth.instance.currentUser;
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
      home: MultiBlocProvider(

        providers: [
        BlocProvider<MapsCubit>(
          create: (context) => MapsCubit(MapsRepository(PlacesWebservices())),
          child: Container(),
        )],


        child:  splashscreen(),
      ),

    );
  }
}





