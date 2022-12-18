import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;
  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class on_boarding extends StatelessWidget {
// بيخليني اربط الزرار بال pageview عشان يخليني اتحرك مبين الور عن طريق الزرار
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/board1.jpeg',
        title:'Get Inspired' ,
        body: 'Cant find solution?'
            ' we offer you the best solutions'
              'in the simplest way'

      //We do all our efforts to help you
      // all time. ',
    ),
    BoardingModel(
      image: 'assets/images/board2.jpeg',
      title:'Our Community',
      body: 'You can communicate with different'
          '  users and technicals that have the same problem',
    ),
    BoardingModel(
      image: 'assets/images/board3.jpeg',
      title:'Our Services' ,
      body: 'We do all our efforts to help you all time',
    ),


  ];
   bool islast = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: CupertinoColors.white.withOpacity(1),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),//بيدي حته انيميشن فالسكرول بتاع الصفحات
                  controller: boardController,
                  onPageChanged: (int index){
                    if(index == boarding.length -1){
                       Navigator.pushReplacement(context,
                           MaterialPageRoute(builder: (context) => logIn()));

                    }
                  },
                  itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [

                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      spacing: 5,
                      expansionFactor: 4,
                      dotHeight: 16,
                      dotWidth: 10,
                    ),
                  ),
                  Spacer(),
                  TextButton(onPressed: (){
                    boardController.nextPage(
                      duration: Duration(milliseconds: 750,),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }, child: Text('NEXT'))
                ],
              )
            ],
          ),
        )
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(image: AssetImage('${model.image}'),),
      SizedBox(
        height: 30,
      ),
      Center(
        child: Text('${model.title}',style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w800,


        ),),
      ),
      SizedBox(
        height: 40,
      ),

 //  print('aaaaaaaaaaaaaaaaaaa7aaa');

  Text('${model.body}',style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold
      ),),
    ],
  );
}
