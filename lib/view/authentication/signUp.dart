import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roadside_assistance/view/authentication/login.dart';

import '../../main.dart';
import '../location/configMaps.dart';
import 'car_information.dart';



class signUp extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var firstNamecontroller = TextEditingController();
  var lastNamecontroller = TextEditingController();
  var vehicleMakecontroller = TextEditingController();
  var vehicleModelcontroller = TextEditingController();
  var colorcontroller = TextEditingController();
  var vehicleLicensecontroller = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 8,right: 8,bottom: 8,),
                child: Text(
                  "welcome Back!",

                  style:GoogleFonts.pacifico(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(146, 248, 0, 1),

                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(right: 72,left: 21),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextFormField(
                  controller: firstNamecontroller,
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
              ),//email
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(right: 72,left: 21),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextFormField(
                  controller: lastNamecontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      labelText: 'Last Name',
                      border: OutlineInputBorder()),
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),//email
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(right: 72,left: 21),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextFormField(
                  controller: emailcontroller,
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
              ),//email
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(right: 72, left: 21),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  controller: vehicleMakecontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Vehicle Make ', border: OutlineInputBorder()),
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ), //email
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(right: 72, left: 21),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  controller: vehicleModelcontroller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Vehicle Model', border: OutlineInputBorder()),
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ), //email
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.only(right: 72, left: 21),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
              ), //email
              SizedBox(
                height: 60,
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
                      labelText: 'License Plate#', border: OutlineInputBorder()),
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
              Container(
                padding: EdgeInsets.only(right: 72,left: 21),
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
              ),//password
              SizedBox(
                height: 15,
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


              SizedBox(
                height: 25,
              ),
              Container(

                width: 200,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(167, 233, 47, 1),
                ),
                child: MaterialButton(
                  onPressed: () {
                    registerNewUser(context);

                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => logIn()));
                  },
                  child: Text(
                    "continue",
                    style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white

                    ),
                  ),
                ),
              ),

            ],
          ),
        )

    );
  }
void registerNewUser(BuildContext context) async{
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
    if(user !=null){
      userRef.child(user.user!.uid).set({
        'first name': firstNamecontroller.text,
        'last name' : lastNamecontroller.text,
        'email' : emailcontroller.text,
        'phone' : '' ,
        'bio' : '' ,
        'Cars' : {
          'vehicle make': vehicleMakecontroller.text,
          'vehicle model': vehicleModelcontroller.text,
          'color': colorcontroller.text,
          'License plate': vehicleLicensecontroller.text,


        }
      });
      currentfirebaseUser = user.user;
    }else{

    }
  }

}
