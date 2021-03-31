import 'dart:math';

import 'package:FinLit/game_pages/home.dart';
import 'package:FinLit/game_pages/prologue.dart';
import 'package:flutter/material.dart';

class ChapterModal extends StatefulWidget {
  int index = 0;
  ChapterModal({this.index = 0});
  @override
  _ChapterModalState createState() =>
      _ChapterModalState(index: this.index, last: this.index);
}

class _ChapterModalState extends State<ChapterModal> {
  final List info = [
    {"chapter": "Chapter 1", "title": "Thrown Away", "concept": "Budgeting"},
    {"chapter": "Chapter 2", "title": "Foundations", "concept": "Savings"},
    {"chapter": "Chapter 3", "title": "Borrowings", "concept": "Borrowings"},
    {"chapter": "Chapter 4", "title": "Insurance", "concept": "Insurance"},
    {"chapter": "Chapter 5", "title": "Return", "concept": "Return"},
    {"chapter": "Chapter 6", "title": "Risk", "concept": "Risk"},
    {"chapter": "Chapter 7", "title": "Asset Allocation", "concept": "Asset Allocation"},
    {"chapter": "Chapter 8", "title": "Global Market", "concept": "Global Market"},
    {"chapter": "Chapter 9", "title": "Securities Market", "concept": "Securities Market"},
    {"chapter": "Chapter 10", "title": "Security-Market Indexes", "concept": "Security-Market Indexes"},
  ];

  int index = 0;
  int last = 0;

  _ChapterModalState({this.index = 0, this.last = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //       title: Text("SELECT CHAPTER",
      //           style: TextStyle(fontFamily: "Roboto", fontSize: 24)),
      //       centerTitle: true,
      //       elevation: 0,
      //       backgroundColor: Color(0xFF5433FF)),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color(0xFFA5FECB),
                Color(0xFF20BDFF),
                Color(0xFF5433FF)
              ]),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text("SELECT CHAPTER",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 40),
            Stack(
              children: <Widget>[
                Container(
                  child: SingleChildScrollView(child: chapterTemplate()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget chapterTemplate() {
    return Container(
        padding: EdgeInsets.only(top: 12, bottom: 16, left: 16, right: 16),
        margin: EdgeInsets.only(top: 16, left: 8, right: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                        width: 180,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text("Financial Concept: ${info[index]["concept"]}",
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 16, fontFamily: "Inter-Medium"),
                            textAlign: TextAlign.center),
                      ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Prologue()),
                  (Route<dynamic> route) => false,
                );
                // print("nice");
              },
              child: Container(
                child: Image.asset('assets/images/ch1 poster.png'),
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index == 0
                      ? GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Transform.rotate(
                                angle: pi,
                                child: Icon(Icons.double_arrow_outlined,
                                    size: 70, color: Colors.transparent)),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              index--;
                            });
                          },
                          child: Container(
                            child: Transform.rotate(
                              angle: pi,
                              child: Icon(Icons.double_arrow_outlined,
                                  size: 70, color: Colors.black),
                            ),
                          ),
                        ),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text(
                          "${info[index]["chapter"]}:",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Inter-Medium"),
                        ),
                      ),
                      // SizedBox(height: 24.0),
                      Container(
                        width: 130,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text("${info[index]["title"]}",
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 18, fontFamily: "Inter-Medium"),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  )),
                  index == info.length - 1 || index >= last
                      ? GestureDetector(
                          onTap: () {},
                          child: Container(
                              child: Icon(Icons.double_arrow_outlined,
                                  size: 70, color: Colors.transparent)),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              index++;
                            });
                          },
                          child: Container(
                              child: Icon(Icons.double_arrow_outlined,
                                  size: 70, color: Colors.black)),
                        ),
                ],
              ),
            ),
          ],
        ));
  }
}
