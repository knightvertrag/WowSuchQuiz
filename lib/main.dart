import 'package:flutter/material.dart';
import 'package:wow_such_quiz/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WowSuchQuiz",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Splashscreen(),
    );
  }

}


