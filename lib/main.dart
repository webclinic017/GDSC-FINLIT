import 'package:FinLit/extra/chaptermodal.dart';
import 'package:FinLit/extra/modal.dart';
import 'package:FinLit/extra/resultmodal.dart';
import 'package:FinLit/game_pages/desk.dart';
import 'package:FinLit/game_pages/home.dart';
import 'package:FinLit/game_pages/kitchen.dart';
import 'package:flutter/material.dart';
import 'package:FinLit/pages/Loading.dart';
import 'package:FinLit/pages/Auth.dart';
import 'package:FinLit/pages/Home.dart';
import 'package:FinLit/pages/quizpage.dart';
import 'package:FinLit/wrapper.dart';
import 'package:FinLit/authentication/auth.dart';
import 'package:provider/provider.dart';
import 'package:FinLit/authentication/users.dart';
void main() {
  var res = {
    "General Personal Finance Knowledge": 5,
    "Savings and Borrowing": 0,
    "Insurance": 4,
    "Investment": 4,
  };

  runApp(
    MyApp(
  ));
  //   MaterialApp(
  //     theme: ThemeData(
  //       primarySwatch: Colors.indigo,
  //   ),
  //   initialRoute: '/result',
  //   routes: {
  //     '/quizpage': (context) => Getjson(),
  //     '/loading': (context) => Loading(),
  //     // '/auth': (context) => Auth(),
  //     '/home': (context) => Home(),
  //     '/result': (context) => ResultModal(res: res,),
  //     '/kitchen': (context) => Kitchen(),
  //     '/gamehome': (context) => GameHome(firstTimeMainBedroom: true),
  //     '/desk': (context) => Desk(),
  //     '/select': (context) => ChapterModal(),
          // '/prologue': (context) => Prologue()
  //   },
  //   )
  // );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     theme: ThemeData(
        primarySwatch: Colors.indigo,
    );
    return StreamProvider<User>.value(  
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}