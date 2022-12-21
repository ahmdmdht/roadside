import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 80,
            ),
            child: Center(
              child: Text(
                'what is the problem?',
                style: GoogleFonts.pacifico(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(167, 233, 47, 1)),
              ),
            ),
          ), // text
          SizedBox(
            height: 60,
          ),
          Container(
            height: 400,
            child: GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) => buildItem(index, context),
              itemCount: 6,
              primary: false,
              padding: const EdgeInsets.all(30),
            ),
          ),
          Container(
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
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              onPressed: () {},
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color:   Color.fromRGBO(167, 233, 47, 1),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_applications_outlined,
                color: Colors.grey,
              ),
              label: 'Settings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_outlined,
                color: Colors.grey,
              ),
              label: 'Community'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notification_important_outlined,
                color: Colors.grey,
              ),
              label: 'Notification'),
        ],
      ),
    );
  }

  Widget buildItem(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 110,
          width: 80,
          decoration: BoxDecoration(
            //color: Color.fromRGBO(230, 237, 254, 1),
            color:
                selectedIndex == index ? Colors.black38 : Colors.grey.shade200,
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
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Image(
                  image: AssetImage('assets/images/board1.jpeg'),
                ),
              ),
              Text(
                'Accident',
                style: GoogleFonts.akshar(
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
    );
  }
}
