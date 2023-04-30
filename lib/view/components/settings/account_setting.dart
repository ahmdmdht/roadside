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
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var userName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();
  var bio = TextEditingController();

  Map<String, dynamic>? map;

  @override
  void initState() {
    super.initState();
    userRef
        .child(CacheHelper.getData(key: 'userId'))
        .get()
        .then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        Map<dynamic, dynamic> userData =
            snapshot.value as Map<dynamic, dynamic>;
        firstName.text = userData['first name'];
        lastName.text = userData['last name'];
        phoneNumber.text = userData['phone'];
        bio.text = userData['bio'];
        email.text = userData['email'];
      }
    });
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
                    controller: firstName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.text,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'First Name', border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        firstName.text = value;
                      });
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: lastName,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.text,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'Last Name', border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        lastName.text = value;
                      });
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: phoneNumber,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.phone,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'phone number',
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        phoneNumber.text = value;
                      });
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.emailAddress,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'email', border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        email.text = value;
                      });

                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: bio,
                    //ده اللي بيتحكملي ف textformfieled
                    keyboardType: TextInputType.text,
                    //يخفي اللي بكتبه ولا لا
                    decoration: InputDecoration(
                        labelText: 'bio', border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      //بيخزن القيمة اللي بكتبها عندي
                      print(value);
                    },
                    onChanged: (value) {
                      // بيخزن كل حرف حرفيا او كل تغير عندي فالكونسول
                      bio.text = value;
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      userRef.child(CacheHelper.getData(key: 'userId')).update({
                        'first name': firstName.text,
                        'last name': lastName.text,
                        'email': email.text,
                        'phone': phoneNumber.text,
                        'bio': bio.text
                      }); // Navigator.pushReplacement(
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
