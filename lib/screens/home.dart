import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wow_such_quiz/screens/quizpages/quizpage.dart';
import 'package:wow_such_quiz/services/auth.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final AuthService _auth = AuthService();

  List<String> images = [
    "images/star.png",
  ];
  Widget customcard(String quizname, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context)  => getjson(),
          ));
        },
        child: Material(
          color: Colors.black,
          elevation: 15.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: Image(
                        image: AssetImage("images/star.png"),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    quizname,
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.yellowAccent,
                      fontFamily: 'Star',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "A very simple star wars trivia quiz",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'Satisfy'
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "WowSuchQuiz",
          style: TextStyle(
            fontFamily: 'Satisfy',
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('logout', style: TextStyle(color: Colors.white),),
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage('images/destroyer.jpg'), fit: BoxFit.cover),
        ),
        child: ListView(
          children: <Widget>[
            customcard('Star Wars', images[0]),
            SizedBox(height: 30.0,)

          ],
        ),
      ),
    );
  }
}
