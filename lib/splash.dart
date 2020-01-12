import 'dart:async';

import 'package:wow_such_quiz/home.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homepage(),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "WowSuchQuiz",
          style: TextStyle(
              fontSize: 50.0,
              fontFamily: 'Satisfy',
              color: Colors.white
          ),

        ),
      ),
    );
  }
}

