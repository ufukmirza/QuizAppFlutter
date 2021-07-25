
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_udemy/Questions.dart';

List<Question> questions=[

  Question(question: "true",questionAnswer: true),
  Question(question: "true",questionAnswer: true),
  Question(question: "false",questionAnswer: false),
  Question(question: "false",questionAnswer: false),
  Question(question: "true",questionAnswer: true),

];

List<Widget> trueFalseList=[

  Icon(Icons.check,color: Colors.green,),
  Icon(Icons.close,color: Colors.red,),
  Icon(Icons.close,color: Colors.red,),
  Icon(Icons.close,color: Colors.red,),
  Icon(Icons.close,color: Colors.red,),


];



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var questionNumber=0;
  var correctAnswer=0;
  List<Widget> trueFalseList=[

    Icon(Icons.close,color: Colors.green,),
    Icon(Icons.close,color: Colors.red,),
    Icon(Icons.close,color: Colors.red,),
    Icon(Icons.close,color: Colors.red,),
    Icon(Icons.close,color: Colors.red,),


  ];




  var rng =  Random();
  var buttonNumber=1;
  var buttonPressed=0;
  var buttonNumber_right=1;
  //var  player=AudioPlayer();
  var  player=AudioCache();
  //final player = new AudioCache(fixedPlayer: AudioPlayer());

 playMusic(int number)  {



switch(number) {
  case 0:
  //   player.play("assets_note1.wav",isLocal: true);
  player.play("assets_note2.wav",mode: PlayerMode.MEDIA_PLAYER);
    break;

  case 1:
       player.play("assets_note2.wav");
    break;

  case 2:
      player.play("assets_note3.wav");
    break;

}



  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SafeArea(
        child:Center(child:Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
        child:Align(
        alignment: Alignment.center,
            child:Center(child: Text(
             questions[questionNumber].question,
              textAlign: TextAlign.center,
              style:TextStyle(
                fontSize: 15,
                color:Colors.white

              )
            ),))),
            Expanded(
        child:    Align(
              alignment: Alignment.bottomCenter,
            child:Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){



  setState(() {


    if(questionNumber==4) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('congratulations'),
          content:  Text('Correct Answer Number : $correctAnswer'),
          actions: <Widget>[
            TextButton(
              onPressed: () {

            correctAnswer=0;
           questionNumber=0;
          trueFalseList.forEach((element) {element= Icon(Icons.close,color: Colors.red,);});
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) =>  MyHomePage(title: "title")),
              ModalRoute.withName('/'),
            );
    },
              child: const Text('Retry'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Exit'),
              child: const Text('OK'),
            ),
          ],
        ),
      ).then((value) => setState((){}));

    }

      if (questions[questionNumber].questionAnswer == true) {
       correctAnswer++;
        trueFalseList[questionNumber] = Icon(Icons.check, color: Colors.green,);
      }
      if(questionNumber<4)
      questionNumber++;
      playMusic(0);




  });

                    }
                    , child: Text("True"),
                    style: ElevatedButton.styleFrom(primary: Colors.green)),
                ElevatedButton(

                    onPressed: (){

                      setState(() {

                        if(questionNumber==4) {

                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );

                        }
  if (questions[questionNumber].questionAnswer == false) {
    trueFalseList[questionNumber] = Icon(Icons.check, color: Colors.green,);
    correctAnswer++;
  }
  if(questionNumber<4)
  questionNumber++;
  playMusic(1);



                      });

                    }
                    , child: Text("False"),
                style: ElevatedButton.styleFrom(primary: Colors.red),),

                Row(
                 // children: [Expanded(child: Text("wsa",style: TextStyle(color: Colors.white),))],
                  children: trueFalseList,
                )
              ],
            )))


          ],))


      ),
      );
     // This trailing comma makes auto-formatting nicer for build methods.
  }

  void pressed(int diceNumber){

    setState(() {

      if(diceNumber==0) {
        buttonNumber = rng.nextInt(6) + 1;
        buttonPressed++;
        if (buttonPressed == 2) {
          buttonNumber_right = rng.nextInt(6) + 1;
          buttonPressed = 0;
        }
      }
      else{

        buttonNumber_right = rng.nextInt(6) + 1;
        buttonPressed++;
        if (buttonPressed == 2) {
          buttonNumber = rng.nextInt(6) + 1;
          buttonPressed = 0;
        }

      }
    });

  }
}

class _MyHomePageState_2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Column(children:[ Text("congrats"),ElevatedButton(onPressed: (){

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: "QuizGame")),
            (Route<dynamic> route) => false,
      );

    }, child: Text("play again"))]);

  }



}

class DialogBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return
      AlertDialog(
        title: Text('Welcome'),
        content: Text('GeeksforGeeks'),

        actions: [
          FlatButton(
            textColor: Colors.black,
            onPressed: () {},
            child: Text('CANCEL'),
          ),
          FlatButton(
            textColor: Colors.black,
            onPressed: () {},
            child: Text('ACCEPT'),
          ),
        ],
      );

  }



}