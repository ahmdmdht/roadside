import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:roadside_assistance/view/authentication/signUp.dart';
import 'package:roadside_assistance/view/authentication/verification.dart';
import 'package:roadside_assistance/view/home_layout.dart';

class forget_password extends StatefulWidget {

  const forget_password({Key? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  var emailcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child:Form(
          key: formKey,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image(
              image: AssetImage('assets/images/forget.jpeg'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Forget  Password? ',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Don’t worry! it happens.Please enter the e-mail adress we will send the OTP IN THE e-mail ',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
        Text(
            'Enter Your gmail ',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold,color: Colors.grey),
          ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
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
          height: 25,
        ),
        Center(
          child: Container(
            
            width:double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.greenAccent),
            child: MaterialButton(
              onPressed: () {

                if(formKey.currentState!.validate()) { Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyVerify()));};


              },
              child: Text(
                "continue",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        ],
        ),
          ),
        ),
      )
    );
  }
}
