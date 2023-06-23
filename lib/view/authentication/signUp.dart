import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadside_assistance/view/authentication/login.dart';

import '../../main.dart';
import '../location/configMaps.dart';

class signUp extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var firstNamecontroller = TextEditingController();
  var lastNamecontroller = TextEditingController();
  var vehicleMakecontroller = TextEditingController();
  var vehicleModelcontroller = TextEditingController();
  var colorcontroller = TextEditingController();
  var vehicleLicensecontroller = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
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
                      "welcome Back!",
                      style: GoogleFonts.pacifico(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 45,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(146, 248, 0, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: firstNamecontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter first name';
                        } else if (value.length < 6) {
                          return 'Enter valid first name ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          border: OutlineInputBorder()),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ), //firstName
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: lastNamecontroller,
                      // validator: (value){
                      //   if(value==null || value.isEmpty){
                      //     return'please enter last name ';
                      //   }else if(value.length<6){
                      //     return 'Enter valid last name ';
                      //   }
                      //   return null;
                      //
                      // },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Last Name', border: OutlineInputBorder()),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ), //lastName
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@gmail+\.com")
                            .hasMatch(value!);
                        if (value.isEmpty) {
                          return 'please enter mail';
                        } else if (!emailValid) {
                          return 'Enter valid e-mail';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email address',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder()),
                      onFieldSubmitted: (data) {
                        print(data);
                      },
                      onChanged: (data) {
                        print(data);
                      },
                    ),
                  ), //emailAddress
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: vehicleMakecontroller,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return'please enter vehicle make ';
                        }

                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Vehicle Make ',
                          border: OutlineInputBorder()),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ), //vehicleMake
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: vehicleModelcontroller,
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return'please enter vehicle model ';
                        }

                      },
                      decoration: InputDecoration(
                          labelText: 'Vehicle Model',
                          border: OutlineInputBorder()),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ), //vehicleModel
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      controller: colorcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Color', border: OutlineInputBorder()),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ), //carColor
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    child: TextFormField(
                      controller: vehicleLicensecontroller,
                      //ده اللي بيتحكملي ف textformfieled
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      //يخفي اللي بكتبه ولا لا
                      decoration: InputDecoration(
                          labelText: 'License Plate#',
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
                    height: 40,
                  ), //licensePlate
                  Container(
                    padding: EdgeInsets.only(right: 72, left: 21),
                    child: TextFormField(
                      controller: passwordcontroller,
                      validator: (value) {
                        // RegExp regex = RegExp(
                        //     r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                        // if (value!.isEmpty) {
                        //   return 'Please enter password';
                        // } else {
                        //   if (!regex.hasMatch(value!)) {
                        //     return 'Enter valid password';
                        //   } else {
                        //     return null;
                        //   }
                        // }
                      },
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
                  ), //password
                  SizedBox(
                    height: 25,
                  ),

                  Divider(
                    indent: 50,
                    endIndent: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 35,
                  ),

                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(167, 233, 47, 1),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        registerNewUser(context);

                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => logIn()));
                        }
                        ;
                      },
                      child: Text(
                        "continue",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ), //continueButton
                ],
              ),
            ),
          ),
        ));
  }

  void registerNewUser(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: emailcontroller.text, password: passwordcontroller.text);
    if (user != null) {
      userRef.child(user.user!.uid).set({
        'first name': firstNamecontroller.text,
        'last name': lastNamecontroller.text,
        'email': emailcontroller.text,
        'phone': '',
        'status': '',
        'bio': '',
        'Cars': {
          'vehicle make': vehicleMakecontroller.text,
          'vehicle model': vehicleModelcontroller.text,
          'color': colorcontroller.text,
          'License plate': vehicleLicensecontroller.text,
        }
      });
      currentfirebaseUser = user.user;
    } else {}
  }
}
