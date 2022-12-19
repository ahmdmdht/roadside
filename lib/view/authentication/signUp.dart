import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class signUp extends StatelessWidget {
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
                  controller: emailcontroller,
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
                  controller: emailcontroller,
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
                    print(emailcontroller.text);
                    print(passwordcontroller.text);
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
}
