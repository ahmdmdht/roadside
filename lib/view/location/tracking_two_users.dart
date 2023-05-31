// import 'dart:async';
//
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class TrackScreen extends StatefulWidget {
//   final String user1Id;
//   final String user2Id;
//
//   TrackScreen({required this.user1Id, required this.user2Id});
//
//   @override
//   _TrackScreenState createState() => _TrackScreenState();
// }
//
// class _TrackScreenState extends State<TrackScreen> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   String distance = '';
//   String time = '';
//
//   @override
//   void initState() {
//     super.initState();
//     DatabaseReference ref = FirebaseDatabase.instance.ref();
//     ref.child('locations/${widget.user1Id}').onValue.listen((event) {
//       var user1 = event.snapshot.value;
//       ref.child('locations/${widget.user2Id}').once().then((event) {
//         var user2 = event.snapshot.value;
//
//         double meters = Geolocator.distanceBetween(
//             user1['lat'], user1['lng'], user2['lat'], user2['lng']
//         );
//
//         var time = Geolocator.distanceBetweenCoordinates(
//             user1['lat'], user1['lng'], user2['lat'], user2['lng']
//         );
//
//         setState(() {
//           this.distance = '${meters.toStringAsFixed(2)} meters';
//           this.time = '${(time / 60).toStringAsFixed(2)} minutes';
//         });
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Track Users'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//                 'Distance between users:'
//             ),
//             Text(
//               distance,
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             Text(
//                 'Estimated time of arrival:'
//             ),
//             Text(
//               time,
//               style: TextStyle(fontSize: 24),
//             )
//           ],
//         )
//     );
//   }
// }