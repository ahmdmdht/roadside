import 'package:flutter/material.dart';
import 'package:roadside_assistance/view/components/settings/setting_design.dart';


import 'Notification.dart';
import 'account_setting.dart';


class Setting1 extends StatefulWidget {
  const Setting1({Key? key}) : super(key: key);

  @override
  State<Setting1> createState() => _Setting1State();
}

class _Setting1State extends State<Setting1> {
  int index=0;
  @override
  Widget build(BuildContext context) {
   // this TabController _tabController =
   //          TabController(length: 2, vsync: );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
             tabs: <Widget>[
               Tab(text: 'Account Setting',),
               Tab(text: 'Notification',)
             ],
          ),

        ),
        body: TabBarView(
          children: <Widget>[
            settingDesign(),
            account_setting(),


          ],
        )



      ),
    );
  }
}
