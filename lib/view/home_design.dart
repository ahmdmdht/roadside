import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utiles/Asset_manger.dart';
import 'Details.dart';

class homeDesign extends StatefulWidget {
  const homeDesign({Key? key}) : super(key: key);

  @override
  State<homeDesign> createState() => _homeDesignState();
}

class _homeDesignState extends State<homeDesign> {
  int selectedIndex=0;
  List listOfImages = [
    AssetManger.getImagePath("Groupjumpoil.svg"),
    AssetManger.getImagePath("Vectoraccident.svg"),
    AssetManger.getImagePath("Vectorgas.svg"),
    AssetManger.getImagePath("Vectoroil.svg"),
    AssetManger.getImagePath("Vectortire.svg"),
    AssetManger.getImagePath("Vectorkey.svg"),
  ];
  List listOfText = [
    "Jump Start",
    "Accident",
    "Out of Gas",
    "Oil",
    "Flat Tire",
    "locked out",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 92,
              ),
              Center(
                child: Text(
                  'what is the problem?',
                  style: GoogleFonts.pacifico(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Color.fromRGBO(167, 233, 47, 1)),
                ),
              ), // text
              SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 300,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30),
                  itemBuilder: (context, index) => buildItem(index, context),
                  itemCount: 6,
                  primary: false,
                ),
              ),
              MaterialButton(
                onPressed: (){},
                child: Container(
                  height: 60,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200.withOpacity(0.5),
                          blurRadius: 40,
                          offset: Offset(-3, -3),
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      'Something else',
                      style: GoogleFonts.akshar(
                        textStyle: Theme.of(context).textTheme.displayMedium,
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => VehicleIssue()));
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
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),

    );
  }
  Widget buildItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          //color: Color.fromRGBO(230, 237, 254, 1),
          color: selectedIndex == index ? Colors.black38 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 8),
              child: SvgPicture.asset(
                listOfImages[index],
                height: 30,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              listOfText[index],
              style: GoogleFonts.akshar(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
