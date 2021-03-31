import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:FinLit/extra/modal.dart';
import 'package:FinLit/extra/progressbar.dart';
import 'package:FinLit/extra/resultmodal.dart';
import 'package:FinLit/pages/Loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("assets/questions.json", cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
              body: Center(
            child: SpinKitCircle(size: 50, color: Color(0xFFD3D3D3)),
          ));
        } else {
          return Modal(
              title: "What's your Financial Literacy Level?",
              description:
                  "By answering the assessment, we can help you have a better learning and gaming experience by tailoring the flow of the game based on your current knowledge on financial concepts.",
              mydata: mydata,
              prevRoute: "Home");
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  // final List mydata;
  var mydata;
  var res = {
    "General Personal Finance Knowledge": 0,
    "Savings and Borrowing": 0,
    "Insurance": 0,
    "Investment": 0,
  };

  QuizPage({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPagestate createState() => _QuizPagestate(mydata, res);
}

class _QuizPagestate extends State<QuizPage> {
  var res;
  var mydata;

  _QuizPagestate(this.mydata, this.res);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.lightGreen[400];
  Color wrong = Colors.red[400];
  int i = 1;
  Map<String, Color> btncolor = {
    "a": Color(0xFF536DFE),
    "b": Color(0xFF536DFE),
    "c": Color(0xFF536DFE),
    "d": Color(0xFF536DFE),
  };

  void nextQuestion() {
    setState(() {
      if (i < 20) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultModal(
              title: "Thank you! You can now start playing. Enjoy!",
              description:
                  "Nice work! Cat wow nice but dog wow nicer and dog da bes among da res!",
              res: res),
        ));
      }

      btncolor["a"] = Color(0xFF5433FF);
      btncolor["b"] = Color(0xFF5433FF);
      btncolor["c"] = Color(0xFF5433FF);
      btncolor["d"] = Color(0xFF5433FF);
    });
  }

  void checkanswer(String k) {
    // print("${mydata[2][i.toString()]} == ${mydata[1][i.toString()][k]}");
    // print("$res");
    
    // wala na sad ni
    // colortoshow =
    //     (mydata[2][i.toString()] == mydata[1][i.toString()][k]) ? right : wrong;

    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      
      setState(() {
        // wala na ni
        // btncolor[k] = colortoshow; 
        if (i >= 1 && i <= 5)
          res["General Personal Finance Knowledge"]++;
        else if (i >= 6 && i <= 11)
          res["Savings and Borrowing"]++;
        else if (i >= 12 && i <= 15)
          res["Insurance"]++;
        else
          res["Investment"]++;
      });
    }

    Timer(Duration(seconds: 1), nextQuestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
      child: ButtonTheme(
        minWidth: 300.0,
        height: 35.0,
        child: OutlineButton(
          // elevation: 5,
          onPressed: () => checkanswer(k),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(
              color: Colors.indigoAccent,
              fontFamily: "Inter-Regular",
              fontSize: 16.0,
            ),
            maxLines: 1,
          ),
          color: btncolor[k],
          splashColor: Color(0xFF536DFE),
          highlightColor: Color(0xFF536DFE),
          padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
          borderSide: BorderSide(
              color: Color(0xFF536DFE), style: BorderStyle.solid, width: 1),
          // minWidth: 250.0,
          // height: 50.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Oops! :(",
                  ),
                  content: Text(
                      "You can't go back at this stage. We are assessing your level of financial literacy."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text("Assessment",
                style: TextStyle(fontFamily: "Roboto", fontSize: 24)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xFF5433FF)),
        body: Container(
          height: MediaQuery.of(context).size.height,
          // margin: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                // colors: <Color>[Colors.lightGreen[200], Colors.cyan[600], Colors.indigoAccent],
                // colors: <Color>[Color(0xFF5433FF), Color(0xFF20BDFF), Color(0xFFA5FECB)]
                colors: <Color>[
                  Color(0xFFA5FECB),
                  Color(0xFF20BDFF),
                  Color(0xFF5433FF)
                ]),
          ),
          child: Container(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                      ),
                      margin: EdgeInsets.fromLTRB(15, 25, 15, 25),
                      // alignment: Alignment.topCenter,
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Question $i/20",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )),
                            ]),
                        Progressbar(i),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 2, 15, 2),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Container(
                                  padding:
                                      EdgeInsets.fromLTRB(30.0, 2, 30.0, 2),
                                  alignment: Alignment.center,
                                  child: Text(
                                    mydata[0][i.toString()],
                                    style: TextStyle(
                                      height: 1.4,
                                      fontSize: 18.0,
                                      fontFamily: "Inter-Medium",
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    choicebutton('a'),
                                    choicebutton('b'),
                                    choicebutton('c'),
                                    choicebutton('d'),
                                    choicebutton('e'),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
