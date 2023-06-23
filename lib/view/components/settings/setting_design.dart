import 'package:flutter/material.dart';


class settingDesign extends StatefulWidget {
  const settingDesign({Key? key}) : super(key: key);

  @override
  State<settingDesign> createState() => _settingDesignState();
}

class _settingDesignState extends State<settingDesign> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Text('Setting', textAlign: TextAlign.center,),
              SizedBox(height: 50,),

              Container(
                padding: EdgeInsets.all(15),

                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                ),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 15,),
                    Text('General'),
                    Spacer(
                      flex: 1,),
                    Icon(Icons.arrow_forward_ios_outlined,)

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey.shade300,
                child: Row(
                  children: [
                    Icon(Icons.language_outlined),
                    SizedBox(width: 15,),
                    Text('Language'),
                    Spacer(
                      flex: 1,),
                    Icon(Icons.arrow_forward_ios_outlined,)

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey.shade300,
                child: Row(
                  children: [
                    Icon(Icons.accessibility),
                    SizedBox(width: 15,),
                    Text('Accessibility'),
                    Spacer(
                      flex: 1,),
                    Icon(Icons.arrow_forward_ios_outlined,)

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey.shade300,
                child: Row(
                  children: [
                    Icon(Icons.privacy_tip_outlined),
                    SizedBox(width: 15,),
                    Text('Privacy and Seurity'),
                    Spacer(
                      flex: 1,),
                    Icon(Icons.arrow_forward_ios_outlined,)

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                ),
                child: Row(
                  children: [

                    SizedBox(width: 15,),
                    Text('Dark Mode'),
                    Spacer(
                      flex: 1,),
                    Icon(Icons.arrow_forward_ios_outlined,)

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
