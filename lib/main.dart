import 'package:flutter/material.dart';
import 'package:wow_such_quiz/models/user.dart';
import 'package:wow_such_quiz/screens/splash.dart';
import 'package:wow_such_quiz/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:wow_such_quiz/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "WowSuchQuiz",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Splashscreen(),
      ),
    );
  }
}
