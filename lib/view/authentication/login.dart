import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadside_assistance/view/authentication/signUp.dart';
import 'package:roadside_assistance/view/authentication/verification.dart';
import 'package:roadside_assistance/view/components/components.dart';

import '../../main.dart';
import '../../remote/cashe_helper.dart';
import '../home_design.dart';
import '../home_layout.dart';
import '../location/maps_Screen.dart';

class logIn extends StatelessWidget {
  @override
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
        body: SingleChildScrollView(
      child: Center(
        child: Form(
          key: formKey,
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
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(right: 72, left: 50),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: (value){
                    bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.com")
                        .hasMatch(value!);
                    if(value.isEmpty){
                      return'please enter mail';
                    }else if(!emailValid){
                      return 'Enter valid e-mail';
                    }
                    return null;

                  },
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
              ),//emailAddress
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(right: 72, left: 50),
                child: TextFormField(
                  controller: passwordcontroller,
                  // validator: (value){
                  //   RegExp regex =
                  //   RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                  //   if (value!.isEmpty) {
                  //     return 'Please enter password';
                  //   } else {
                  //     if (!regex.hasMatch(value!)) {
                  //       return 'Enter valid password';
                  //     } else {
                  //       return null;
                  //     }
                  //   }
                  // },
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
              ),//password
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyVerify()));
                      },
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
                height: 20,
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
                     if(formKey.currentState!.validate()) { Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: (context) => HomeLayout()));};


                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),//logButton
            ],
          ),
        ),
      ),
    )
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
        print(value.user!.uid);

         CacheHelper.sharedPreferences.setString("userId", value.user!.uid);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => homeDesign()) ,(route) => false,);


      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');

      }
    }
    
  }
}
