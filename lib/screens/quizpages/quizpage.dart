import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wow_such_quiz/screens/quizpages/resultpage.dart';

import 'package:flutter/material.dart';

class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/star.json'),
      builder: (context, snapshot) {
        var mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return Quizpage(mydata: mydata);
        }
      },
    );
  }
}

class Quizpage extends StatefulWidget {

  var mydata;

  Quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<Quizpage> {

  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.white;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showtimer = '30';

  Map<String, Color> btncolor = {
    "a" : Colors.transparent,
    "b" : Colors.transparent,
    "c" : Colors.transparent,
    "d" : Colors.transparent,
  };

  bool canceltimer = false;

  @override
  void initState(){
    starttimer();
    super.initState();
  }



  void starttimer() async{
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      setState(() {
        if(timer < 1){
          t.cancel();
          nextquestion();
        }else if(canceltimer == true){
          t.cancel();
        }
        else{
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion(){
    canceltimer = false;
    timer = 30;
    setState(() {
      if(i < 4){
        i++;
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Resultpage(marks : marks),
        ));
      }
      btncolor['a'] = Colors.transparent;
      btncolor['b'] = Colors.transparent;
      btncolor['c'] = Colors.transparent;
      btncolor['d'] = Colors.transparent;
    });
    starttimer();
  }

  void checkanswer(String k){
    if(mydata[2][i.toString()] == mydata[1][i.toString()][k]){
      marks++;
      colortoshow = right;
    }
    else{
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
    });

    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Alike',
            fontSize: 16.0,
          ),
          maxLines: 2,
        ),
        color: btncolor[k],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        splashColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Wow Such Quiz"
            ),
            content: Text(
              "You can't pussy out now."
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Ok'
                ),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(image: AssetImage('images/renback.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    mydata[0][i.toString()],
                    style: TextStyle(fontSize: 16.0, fontFamily: "StarR", color: Colors.yellowAccent),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      choicebutton('a'),
                      choicebutton('b'),
                      choicebutton('c'),
                      choicebutton('d'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text(
                      showtimer,
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Times New Roman',
                          color: Colors.yellowAccent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


