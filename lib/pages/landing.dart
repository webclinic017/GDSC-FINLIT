import 'dart:async';

import 'package:flutter/material.dart';

class HomeLanding extends StatefulWidget {
  @override
  _HomeLandingState createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  Timer _timer;
  final TextEditingController controller = TextEditingController();

  final List info = [
    {
      "imageUrl": "assets/images/game.jpg",
      "title": "Phantasia",
      "description":
          "In the game, the user assumes a role as a financial adviser and from there, will help clients make wise financial decisions. Like any adventure-based online game, FinLit features a storyline divided into chapters and further split into several sub-chapters, with each chapter delving into one particular topic pertaining to financial literacy. The storyline focuses on the user as a financial adviser assisting a particular client. To help the client grow, the user has to do financial-related task."
    },
    {
      "imageUrl": "assets/images/stock market.jpg",
      "title": "Stock Market Simulation",
      "description":
          "Stock Market Simulation is a feature where the user gets to apply his previous learnings from the chapter-based game and put his trading skills to the test. This feature aims to give the user an in-depth understanding of how the stock market works. Through the Stock Market Simulation, the user can trade stocks in real-time using virtual currency. This feature also allows the user to talk with fellow players about investment strategies. Ultimately, the user has to build his own stock portfolio and manage its risks."
    },
    {
      "imageUrl": "assets/images/news.jpg",
      "title": "Info Corner",
      "description":
          "Info Corner is a feature where users can learn about the current economic situation of the country and the rest of the world. This Info Corner is designed to keep users fully informed and up-to-date with the economic events happening. Verified informational videos are also included for the benefit of users who are visual learners."
    },
    {
      "imageUrl": "assets/images/forum.jpg",
      "title": "Community Forum",
      "description":
          "Community Forum is a feature where it encourages a community of financially responsible individuals. Through this, users can share their experiences, give tips, consult privately with professionals, and be part of a community that aims to promote financial education. This section will offer various incentives for the financial professionals so that they will be encouraged to contribute and help those who are in the process of learning financial literacy."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tip of the Day",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter-Medium"),
                      ),
                      SizedBox(height: 20),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
                          margin: EdgeInsets.fromLTRB(12, 8, 12, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[800].withOpacity(0.3),
                                spreadRadius: 4,
                                blurRadius: 15,
                                offset: Offset(
                                    0, 1.2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Ink(
                                child: ClipRRect(
                                    child: Image.asset("assets/images/tips.jpg",
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                                              child: Container(
                                  // margin: EdgeInsets.only(right: 10),
                                  width: 160,
                                  padding: EdgeInsets.only(
                                      right: 10, top: 5, bottom: 5),
                                  child: Text(
                                      "It’s pretty much how we get anything added to the curriculum. When parents said children needed to be computer literate, the schools started responding. The same thing is true of basic financial literacy.",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          height: 1.4,
                                          fontFamily: "Inter-Medium",
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 24),
                      Text(
                        "Be Financially Literate",
                        style: TextStyle(
                            letterSpacing: 1.3,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter-Medium"),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 400,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: info.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return horizontalCard(index);
                              // return Text("wew");
                            }),
                      ),
                      SizedBox(height: 150),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }

  Widget horizontalCard(int index) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Column(
              // CrossAxisAlignment: CrossAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 8, 0, 10),
                  margin: EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(info[index]["imageUrl"],
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  margin: EdgeInsets.fromLTRB(12, 0, 12, 10),
                  child: Text(info[index]["title"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: "Inter-Medium",
                          fontWeight: FontWeight.w800,
                          fontSize: 18)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  margin: EdgeInsets.fromLTRB(12, 0, 12, 10),
                  child: Text(
                      info[index]["description"],
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify),
                ),
              ],
            )),
      ),
    );
  }

  Widget myDialog(BuildContext context, String txt) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 16,
      child: Container(
        height: 400,
        width: 360.0,
        child: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(txt,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontFamily: "Inter-Medium",
                            fontSize: 16.0,
                            letterSpacing: 0.4,
                          ))),
                ],
              )),
        ),
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    this.title,
    this.time,
    this.people,
    this.color,
    this.nextColor,
    this.icon,
  });

  final String title;
  final String time;
  final String people;
  final Icon icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 25.0,
          bottom: 25,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          // fontWeight: FontWeight.bold,
                          fontFamily: "Ubuntu"),
                    ),
                    Row(),
                  ]),
            ),
            Expanded(
              child: Container(
                child: icon,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CurvedFeature extends StatelessWidget {
  const CurvedFeature({
    this.title,
    this.time,
    this.icon,
    this.people,
    this.color,
    this.nextColor,
  });

  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding:
            const EdgeInsets.only(left: 32, top: 15, bottom: 15, right: 32),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(
                height: 2,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: "Ubuntu-Reg",
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}
