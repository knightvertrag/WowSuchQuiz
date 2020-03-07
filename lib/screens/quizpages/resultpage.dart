import 'package:flutter/material.dart';
import 'package:wow_such_quiz/screens/home.dart';


class Resultpage extends StatefulWidget {
  final int marks;
  Resultpage({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultpageState createState() => _ResultpageState(marks);
}

class _ResultpageState extends State<Resultpage> {


  List<String> images = [
    "images/good.jpg",
    "images/idiot.jpg"
  ];

  String image;
  String message;

  @override
  void initState(){
    if(marks <= 2){
      image = images[1];
      message = "LOL\n" + "You scored $marks";
    }else{
      image = images[0];
      message = "GG\n" + "You scored $marks";
    }
    super.initState();
  }

  int marks;
  _ResultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          "Result"
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        color: Colors.black,
                        width: 300.0,
                        height: 300.0,
                        child: Image(
                          image: AssetImage(image),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Star",
                          color: Colors.yellowAccent
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ));
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Star',
                      color: Colors.yellowAccent
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  borderSide: BorderSide(width: 5.0, color: Colors.yellowAccent),
                  splashColor: Colors.yellowAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
