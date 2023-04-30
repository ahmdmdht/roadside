import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadside_assistance/configMaps.dart';

import '../../../main.dart';
import '../../../remote/cashe_helper.dart';
import '../../authentication/car_information.dart';

class account_setting extends StatefulWidget {
  @override
  State<account_setting> createState() => _account_settingState();
}

class _account_settingState extends State<account_setting> {
  var fullName = TextEditingController();
  var userName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();
  var bio = TextEditingController();

  Map<String,dynamic> ?  map ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userRef.child(CacheHelper.getData(key: "userId")).get().then((value) {

      print(value.value);
    });
   // DatabaseReference reference userRef.get();




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        actions: [
          IconButton(
              onPressed: () async {
                final ref = FirebaseDatabase.instance.ref();
                final snapshot = await ref.child('users').get();
                if (snapshot.exists) {
                  print("asdasdasds");
                } else {
                  print('No data available.');
                }
              },
              icon: Icon(Icons.bluetooth_connected_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Your Profile Picture',
              style: GoogleFonts.manrope(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 10,
                color: Colors.black38,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Icon(Icons.add_photo_alternate_outlined),
                  Text(
                    'Upload Your photo',
                    style: GoogleFonts.manrope(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 8,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fullName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fullName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fullName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'phone number',
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fullName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fullName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'bio',
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => car_information()));
                    },
                    child: Text(
                      "continue",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
