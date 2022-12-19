import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80,),
            child: Center(
              child: Text('what is the problem?',
                style:GoogleFonts.pacifico(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(167, 233, 47, 1)),
              ),
            ),
          ),// text
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30,),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          height:110 ,
                          width: 80,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 237, 254, 1),
                            color: isSelected ? Colors.black38 :  Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color : Colors.white,
                                blurRadius: 30,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 8),
                                child: Icon(Icons.add_alert,
                                    size: 45,
                                    color: Color.fromRGBO(167, 233, 47, 1)),
                              ),
                              Text('Accident',style:GoogleFonts.akshar(
                                textStyle: Theme.of(context).textTheme.displayMedium,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,


                              ),

                              ),
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          height:110 ,
                          width: 80,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 237, 254, 1),
                            color: isSelected ? Colors.black38 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 30,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 8),
                                child: Icon(Icons.add_alert,
                                    size: 45, color: Color.fromRGBO(167, 233, 47, 1)),
                              ),
                              Text('Accident',style:GoogleFonts.akshar(
                                textStyle: Theme.of(context).textTheme.displayMedium,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,


                              ),

                              ),
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          height:110 ,
                          width: 80,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 237, 254, 1),
                            color: isSelected ? Colors.black38 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 30,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 8),
                                child: Icon(Icons.add_alert,
                                    size: 45, color: Color.fromRGBO(167, 233, 47, 1)),
                              ),
                              Text('Accident',style:GoogleFonts.akshar(
                                textStyle: Theme.of(context).textTheme.displayMedium,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,


                              ),

                              ),
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),

              ],
            ),
          ),//items(1)
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30,),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          height:110 ,
                          width: 80,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 237, 254, 1),
                            color: isSelected ? Colors.black38 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 30,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 8),
                                child: Icon(Icons.add_alert,
                                    size: 45, color: Color.fromRGBO(167, 233, 47, 1)),
                              ),
                              Text('Accident',style:GoogleFonts.akshar(
                                textStyle: Theme.of(context).textTheme.displayMedium,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,


                              ),

                              ),
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          height:110 ,
                          width: 80,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 237, 254, 1),
                            color: isSelected ? Colors.black38 :Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 30,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 8),
                                child: Icon(Icons.add_alert,
                                    size: 45, color: Color.fromRGBO(167, 233, 47, 1)),
                              ),
                              Text('Accident',style:GoogleFonts.akshar(
                                textStyle: Theme.of(context).textTheme.displayMedium,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,


                              ),

                              ),
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          height:110 ,
                          width: 80,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(230, 237, 254, 1),
                            color: isSelected ? Colors.black38 : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 30,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 8),
                                child: Icon(Icons.add_alert,
                                    size: 45, color: Color.fromRGBO(167, 233, 47, 1)),
                              ),
                              Text('Accident',style:GoogleFonts.akshar(
                                textStyle: Theme.of(context).textTheme.displayMedium,
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,


                              ),

                              ),
                            ],
                          ),
                        ),
                      ),



                    ],
                  ),
                ),

              ],
            ),
          ),//items(2)
          SizedBox(
            height: 30,
          ),
          Container(
            height: 60,
            width:220,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
                boxShadow:[ BoxShadow(
                  color: Colors.grey.shade200.withOpacity(0.5),
                  blurRadius: 40,
                  offset: Offset(-3,-3),

                ),]

            ),
            child: Center(
              child: Text('Something else',style:GoogleFonts.akshar(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w500,


              ),
              ),
            ),


          )
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        //onTap: (){},
        type: BottomNavigationBarType.fixed,


        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_outlined,color:Colors.grey,), label: 'Settings'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined,color:Colors.grey,), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(Icons.home,color:Colors.grey,), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined,color:Colors.grey, ), label: 'Community'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_outlined,color:Colors.grey,), label: 'Notification'),
      ],

      ) ,
    );
  }
}
