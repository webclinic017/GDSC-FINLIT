import 'package:FinLit/pages/home.dart';
import 'package:FinLit/pages/quizpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Modal extends StatelessWidget {
  final String title, description;
  var mydata; // ignore this lang
  final String prevRoute; // ignore this lang pud
  Modal({this.title, this.description, this.mydata, this.prevRoute = " "});

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return dialogContent(context);
  }

  Widget dialogContent(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                            child: Container(
                    padding:
                        EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
                    margin: EdgeInsets.only(top: 0, left: 8, right: 8),
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
                        SizedBox(height: 8),
                        Container(
                          child: Image.asset('assets/images/assessment_1.png'),
                        ),
                        SizedBox(height: 8),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(description,
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify),
                        ),
                        SizedBox(height: 24.0),
                        ButtonTheme(
                          minWidth: 335.0,
                          height: 35.0,
                          child: FlatButton(
                            // elevation: 5,
                            onPressed: () {
                               Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => QuizPage(mydata: mydata),
                                  ));
                            },
                            child: Text(
                              "Take Assessment",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Inter-Regular",
                                fontSize: 16.0,
                              ),
                              maxLines: 1,
                            ),
                            color: Colors.indigoAccent,
                            splashColor: Colors.indigoAccent[700],
                            highlightColor: Colors.indigo[700],
                            padding: EdgeInsets.fromLTRB(75, 14, 75, 14),
                            // borderSide: BorderSide(
                            //     color: Color(0xFF536DFE), style: BorderStyle.solid, width: 1),
                            // minWidth: 250.0,
                            // height: 50.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        ButtonTheme(
                          minWidth: 335.0,
                          height: 35.0,
                          child: OutlineButton(
                            // elevation: 5,
                            onPressed: () {
                              if (prevRoute == "Home") {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => Home()),
                                    (Route<dynamic> route) => false,
                                  );
                                }
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontFamily: "Inter-Regular",
                                fontSize: 16.0,
                              ),
                              maxLines: 1,
                            ),
                            color: Colors.indigoAccent,
                            splashColor: Colors.grey[400],
                            highlightColor: Colors.grey[400],
                            padding: EdgeInsets.fromLTRB(75, 14, 75, 14),
                            borderSide: BorderSide(
                                color: Color(0xFF536DFE), style: BorderStyle.solid, width: 1),
                            // minWidth: 250.0,
                            // height: 50.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
