import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authentication/car_information.dart';
import 'location/maps_Screen.dart';

class VehicleIssue  extends StatefulWidget {
  const VehicleIssue({Key? key}) : super(key: key);

  @override
  State<VehicleIssue> createState() => _VehState();
}

class _VehState extends State<VehicleIssue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70.withOpacity(0.7),
        shadowColor: Colors.white70,
        
        centerTitle: true,
        title: Text(
          'Vehicle Issue',
          style: GoogleFonts.akshar(
            textStyle: Theme.of(context).textTheme.displayMedium,
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              height: 50,
            ),
            Text('Details',style: GoogleFonts.akshar(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: 20,
            ),
            Text('Are there any further details you would like to pass on to your request ',style: GoogleFonts.akshar(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: Colors.grey,
              maxLines: 15,
              keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Type here...',
                  fillColor: Colors.grey
                ),




            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocationScreen()));
                  },
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color.fromRGBO(167, 233, 47, 1),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: GoogleFonts.akshar(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
