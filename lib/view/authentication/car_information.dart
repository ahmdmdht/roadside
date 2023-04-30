// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:roadside_assistance/configMaps.dart';
// import 'package:roadside_assistance/main.dart';
// import 'package:firebase_database/firebase_database.dart';
// import '../home_layout.dart';
//
// class car_information extends StatelessWidget {
//   @override
//   final databaseReference = FirebaseDatabase.instance.reference();
//   var vehicleMakecontroller = TextEditingController();
//   var vehicleModelcontroller = TextEditingController();
//   var colorcontroller = TextEditingController();
//   var vehicleLicensecontroller = TextEditingController();
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               top: 50,
//               left: 16,
//               right: 8,
//               bottom: 8,
//             ),
//             child: Text(
//               "Vehicle Info",
//               style: GoogleFonts.poppins(
//                 textStyle: Theme.of(context).textTheme.displayMedium,
//                 fontSize: 25,
//                 fontWeight: FontWeight.w500,
//                 fontStyle: FontStyle.normal,
//                 color: Color.fromRGBO(0, 0, 0, 1),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 33),
//             child: Text(
//               "Help us to recognize you faster",
//               style: GoogleFonts.roboto(
//                 textStyle: Theme.of(context).textTheme.displayMedium,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 fontStyle: FontStyle.normal,
//                 color: Color.fromRGBO(59, 89, 152, 1),
//               ),
//             ),
//           ),
//
//           SizedBox(
//             height: 40,
//           ),
//           Container(
//             padding: EdgeInsets.only(right: 72, left: 21),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//             child: TextFormField(
//               controller: vehicleMakecontroller,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                   labelText: 'Vehicle Make ', border: OutlineInputBorder()),
//               onFieldSubmitted: (value) {
//                 print(value);
//               },
//               onChanged: (value) {
//                 print(value);
//               },
//             ),
//           ), //email
//           SizedBox(
//             height: 60,
//           ),
//           Container(
//             padding: EdgeInsets.only(right: 72, left: 21),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//             child: TextFormField(
//               controller: vehicleModelcontroller,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                   labelText: 'Vehicle Model', border: OutlineInputBorder()),
//               onFieldSubmitted: (value) {
//                 print(value);
//               },
//               onChanged: (value) {
//                 print(value);
//               },
//             ),
//           ), //email
//           SizedBox(
//             height: 60,
//           ),
//           Container(
//             padding: EdgeInsets.only(right: 72, left: 21),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
//             child: TextFormField(
//               controller: colorcontroller,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                   labelText: 'Color', border: OutlineInputBorder()),
//               onFieldSubmitted: (value) {
//                 print(value);
//               },
//               onChanged: (value) {
//                 print(value);
//               },
//             ),
//           ), //email
//           SizedBox(
//             height: 60,
//           ),
//           Container(
//             padding: EdgeInsets.only(right: 72, left: 21),
//             child: TextFormField(
//               controller: vehicleLicensecontroller,
//               //ده اللي بيتحكملي ف textformfieled
//               keyboardType: TextInputType.text,
//               obscureText: true,
//               //يخفي اللي بكتبه ولا لا
//               decoration: InputDecoration(
//                   labelText: 'License Plate#', border: OutlineInputBorder()),
//               onFieldSubmitted: (value) {
//                 //بيخزن القيمة اللي بكتبها عندي
//                 print(value);
//               },
//               onChanged: (value) {
//                 // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
//                 print(value);
//               },
//             ),
//           ), //password
//           SizedBox(
//             height: 15,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Divider(
//             indent: 50,
//             endIndent: 50,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           SizedBox(
//             height: 25,
//           ),
//           Center(
//             child: Container(
//               width: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Color.fromRGBO(167, 233, 47, 1),
//               ),
//               child: MaterialButton(
//                 onPressed: () {
//
//                   userRef.child(currentfirebaseUser!.uid).set({
//                     'vehicle make': vehicleMakecontroller.text,
//                     'vehicle model': vehicleModelcontroller.text,
//                     'color': colorcontroller.text,
//                     'License plate': vehicleLicensecontroller.text,
//                   } ,);
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => HomeLayout()));
//                 },
//                 child: Text(
//                   "Done",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
//
//
//
// // void saveDriverCarInfo(context){
// //   String userId = currentfirebaseUser!.uid;
// //   print(userId);
// //
// //   Map carInfoMap=
// //       {
// //         'vehicle make':vehicleMakecontroller.text,
// //         'vehicle model':vehicleModelcontroller.text,
// //         'color':colorcontroller.text,
// //         'License plate#':vehicleLicensecontroller.text,
// //       };
// //
// //   userRef.child(userId).child('car_details').set(carInfoMap);
// // }
// }
// /////////////////////////////////////////////////////////////////////////
//
// //
// // class CarRegistration extends StatefulWidget {
// //   @override
// //   _CarRegistrationState createState() => _CarRegistrationState();
// // }
// //
// // class _CarRegistrationState extends State<CarRegistration> {
// //
// //
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController modelController = TextEditingController();
// //   TextEditingController yearController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Car Registration'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(10),
// //         child: ListView(
// //           children: <Widget>[
// //             Container(
// //               alignment: Alignment.center,
// //               padding: EdgeInsets.all(10),
// //               child: Text(
// //                 'Register Your Car',
// //                 style: TextStyle(
// //                     color: Colors.blue,
// //                     fontWeight: FontWeight.w500,
// //                     fontSize: 30),
// //               ),
// //             ),
// //             Container(
// //               padding: EdgeInsets.all(10),
// //               child: TextField(
// //                 controller: nameController,
// //                 decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Name',
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               padding: EdgeInsets.all(10),
// //               child: TextField(
// //                 controller: modelController,
// //                 decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Model',
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               padding: EdgeInsets.all(10),
// //               child: TextField(
// //                 controller: yearController,
// //                 decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: 'Year',
// //                 ),
// //               ),
// //             ),
// //             Container(
// //                 height: 50,
// //                 padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
// //                 child: RaisedButton(
// //                   textColor: Colors.white,
// //                   color: Colors.blue,
// //                   child:
// //                   Text('Register'),
// //                   onPressed: () {
// //                     .then((_) {
// //                       Scaffold.of(context).showSnackBar(SnackBar(content:
// //                       Text('Successfully Registered')));
// //                       nameController.clear();
// //                       modelController.clear();
// //                       yearController.clear();
// //                     }).catchError((onError) {
// //                       Scaffold.of(context).showSnackBar(SnackBar(content:
// //                       Text(onError)));
// //                     });
// //                   },
// //                 )),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
