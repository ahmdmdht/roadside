import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen.dart';



class car_information extends StatelessWidget {
  @override
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left:16,right: 8,bottom: 8,),
                child: Text(
                  "Vehicle Info",

                  style:GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color.fromRGBO(0, 0, 0, 1),

                  ),





                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: Text(
                  "Help us to recognize you faster",

                  style:GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color.fromRGBO(59, 89, 152, 1),

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
                  keyboardType: TextInputType.text,
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                      labelText: 'Color',

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
              Center(
                child: Container(

                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(167, 233, 47, 1),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white

                      ),
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
