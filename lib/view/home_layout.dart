import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utiles/Asset_manger.dart';
import 'Details.dart';
import 'components/settings/Notification.dart';
import 'components/settings/account_setting.dart';
import 'components/settings/setting1.dart';
import 'home_design.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=2;
  List<Widget> screens=[

    Setting1(),
    account_setting(),
    homeDesign(),
    Setting1(),
    notification(),
  ];

  void onItemTap(int index){
    setState(() {
      currentIndex=index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
        onTap: onItemTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_applications_outlined,
                color: Colors.grey,
              ),
              label: 'Settings'),
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


}
