import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadside_assistance/view/authentication/signUp.dart';
import 'package:roadside_assistance/view/components/components.dart';

import '../../main.dart';
import '../../remote/cashe_helper.dart';
import '../home_layout.dart';

class logIn extends StatelessWidget {
  @override
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Text(
              "Hello!",
              style: GoogleFonts.pacifico(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 45,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(167, 233, 47, 1),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(right: 72, left: 50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
              onFieldSubmitted: (value) {
                print(value);
              },
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            padding: EdgeInsets.only(right: 72, left: 50),
            child: TextFormField(
              controller: passwordcontroller,
              //ده اللي بيتحكملي ف textformfieled
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              //يخفي اللي بكتبه ولا لا
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
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
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget your password?",
                  )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            indent: 50,
            endIndent: 50,
            color: Colors.grey,
          ),
          SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => signUp()));
              },
              child: Text(
                "Don’t have an account?",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
              )),
          SizedBox(
            height: 25,
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primaryColor),
            child: MaterialButton(
              onPressed: () {
                 loginWithFirebase(context);

                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomeLayout()));
              },
              child: Text(
                "Log in",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    )
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: [
        //       Container(
        //         color: Colors.blue,
        //         child: Text(
        //           "second page",style: TextStyle(
        //           color: Colors.white60,
        //           fontSize: 30.0,
        //
        //         ),
        //         ),
        //       ),
        //       Container(
        //
        //         child: Text(
        //           "second page",style: TextStyle(
        //           color: Colors.white60,
        //           fontSize: 30.0,
        //           backgroundColor: Colors.blue,
        //         ),
        //         ),
        //       ),
        //       Container(
        //
        //         child: Text(
        //           "second page",style: TextStyle(
        //           color: Colors.white60,
        //           fontSize: 30.0,
        //           backgroundColor: Colors.blue,
        //         ),
        //         ),
        //       ),
        //       Container(
        //
        //         child: Text(
        //           "second page",style: TextStyle(
        //           color: Colors.white60,
        //           fontSize: 30.0,
        //           backgroundColor: Colors.blue,
        //         ),
        //         ),
        //       ),
        //
        //     ],
        //   ),
        // ),

        );
  }

  void loginWithFirebase(BuildContext context) async {

  User ?  credential ;
    var auth = FirebaseAuth.instance;
    try {
       credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text
      ).then((value) {

        CacheHelper.sharedPreferences.setString("userId", credential!.uid);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => HomeLayout()) ,(route) => false,);


      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

      }
    }
    // if (user != null) {
    //   userRef.child(user.user!.uid).once().then((value){
    //     print("1232123");
    //   });
    // } else {}
  }
}
