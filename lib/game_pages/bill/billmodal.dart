import 'package:FinLit/extra/gamemenu.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BillModal extends StatefulWidget {
  @override
  _BillModalState createState() => _BillModalState();
}

class _BillModalState extends State<BillModal> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: null,
          actions: [
            IconButton(
              tooltip: "Go back to Home",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GameMenu(bgUrl: "door.png")));
              },
              icon: Icon(Icons.home),
              color: Colors.white,
              highlightColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
                    child: Container(
              height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/door.png"),
                  fit: BoxFit.cover,
                )),
                child: Stack(children: [
                  Positioned(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                // color: Colors.white,
                                width: 500,
                                height: 250,
                                // color: Colors.white24,
                                //                 decoration: BoxDecoration(
                                //                   color: Colors.white,
                                //                   border: Border.all(
                                //                     color: Colors.white,
                                //                     width: 2,
                                //                   ),
                                //                   borderRadius: BorderRadius.all(
                                // Radius.circular(10.0)),
                                //                 ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      child: Text("Add to Budget",
                                          style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(.0, 2.0),
                                                  blurRadius: 3.0,
                                                  color:
                                                      Color.fromARGB(255, 0, 0, 0),
                                                ),
                                              ],
                                              fontFamily: "Ubuntu",
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ),
                                    ButtonTheme(
                                      minWidth: 300,
                                      height: 30,
                                      child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 10,
                                              offset: Offset(0, -1),
                                            ),
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 10,
                                              offset: Offset(-1, -1),
                                            ),
                                            
                                          ],
                                        ),
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.black54,
                                          splashColor: Colors.black,
                                          highlightColor: Colors.black,
                                          child: Text("Income",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Inter-Medium",
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                    ButtonTheme(
                                      minWidth: 300,
                                      height: 30,
                                      child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 10,
                                              offset: Offset(0, -1),
                                            ),
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 10,
                                              offset: Offset(-1, -1),
                                            ),
                                            
                                          ],
                                        ),
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          color: Colors.black54,
                                          splashColor: Colors.black,
                                          highlightColor: Colors.black,
                                          child: Text("Fixed Expense",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Inter-Medium",
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ),
                                    ButtonTheme(
                                      minWidth: 300,
                                      height: 30,
                                      child: Container(
                                        margin: EdgeInsets.all(0),
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 10,
                                              offset: Offset(0, -1),
                                            ),
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.2),
                                              blurRadius: 10,
                                              spreadRadius: 10,
                                              offset: Offset(-1, -1),
                                            ),
                                            
                                          ],
                                        ),
                                        child: RaisedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(40)),
                                                  elevation: 16,
                                                  child: Container(
                                                    height: 400,
                                                    width: 360.0,
                                                    color: Colors.transparent,
                                                    child: SingleChildScrollView(
                                                      child: Container(
                                                        margin: EdgeInsets.fromLTRB(
                                                            20, 20, 20, 20),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.fromLTRB(
                                                                      20, 00, 20, 00),
                                                              child: Container(
                                                                child: Text(
                                                                  "Variable Expenses",
                                                                  style: TextStyle(
                                                                    color: Colors
                                                                        .grey[800],
                                                                    fontFamily:
                                                                        "Inter-Medium",
                                                                    fontSize: 18.0,
                                                                    letterSpacing:
                                                                        0.4,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(20, 50,
                                                                        20, 20),
                                                                child: Container(
                                                                    width: 500,
                                                                    child: TextField(
                                                                      onChanged:
                                                                          (String
                                                                              txt) {},
                                                                      decoration:
                                                                          InputDecoration(
                                                                              contentPadding: EdgeInsets.fromLTRB(
                                                                                  25,
                                                                                  8,
                                                                                  8,
                                                                                  8),
                                                                              fillColor:
                                                                                  Colors
                                                                                      .white,
                                                                              filled:
                                                                                  true,
                                                                              enabledBorder:
                                                                                  OutlineInputBorder(
                                                                                borderRadius:
                                                                                    BorderRadius.all(Radius.circular(50)),
                                                                                borderSide:
                                                                                    BorderSide(color: Color(0xFF5433FF)),
                                                                              ),
                                                                              focusedBorder:
                                                                                  OutlineInputBorder(
                                                                                borderRadius:
                                                                                    BorderRadius.all(Radius.circular(50)),
                                                                                borderSide:
                                                                                    BorderSide(color: Colors.black),
                                                                              ),
                                                                              hintText:
                                                                                  "Enter amount",
                                                                              hintStyle:
                                                                                  TextStyle(
                                                                                color:
                                                                                    Colors.black38,
                                                                                fontFamily:
                                                                                    "Inter-Medium",
                                                                              )),
                                                                    ))),
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.fromLTRB(
                                                                      20, 10, 20, 10),
                                                              child: ButtonTheme(
                                                                  minWidth: 300,
                                                                  height: 50,
                                                                  child: RaisedButton(
                                                                      onPressed: () {
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                        "CONFIRM",
                                                                        style:
                                                                            TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              "Inter-Regular",
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                        maxLines: 1,
                                                                      ),
                                                                      color: Colors
                                                                          .black54,
                                                                      splashColor:
                                                                          Colors.green[
                                                                              700],
                                                                      highlightColor:
                                                                          Colors.green[
                                                                              800],
                                                                      padding:
                                                                          EdgeInsets
                                                                              .fromLTRB(
                                                                                  10,
                                                                                  5,
                                                                                  10,
                                                                                  5),
                                                                      // minWidth: 250.0,
                                                                      // height: 50.0,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  5.0)))),
                                                            ),
                                                            Container(
                                                              margin:
                                                                  EdgeInsets.fromLTRB(
                                                                      20, 10, 20, 10),
                                                              child: ButtonTheme(
                                                                  minWidth: 300,
                                                                  height: 50,
                                                                  child: RaisedButton(
                                                                      onPressed: () {
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop();
                                                                      },
                                                                      child: Text(
                                                                        "CANCEL",
                                                                        style:
                                                                            TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              "Inter-Regular",
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                        maxLines: 1,
                                                                      ),
                                                                      color: Colors
                                                                          .black38,
                                                                      splashColor:
                                                                          Colors.red[
                                                                              700],
                                                                      highlightColor:
                                                                          Colors.red[
                                                                              800],
                                                                      padding:
                                                                          EdgeInsets
                                                                              .fromLTRB(
                                                                                  10,
                                                                                  5,
                                                                                  10,
                                                                                  5),
                                                                      // minWidth: 250.0,
                                                                      // height: 50.0,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  5.0)))),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          color: Colors.black54,
                                          splashColor: Colors.black,
                                          highlightColor: Colors.black,
                                          child: Text("Variable Expense",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Inter-Medium",
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
                ])),
          ),
        ));
  }
}
