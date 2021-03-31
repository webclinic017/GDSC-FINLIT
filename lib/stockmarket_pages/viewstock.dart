import 'dart:async';

import 'package:FinLit/models/stockmodel.dart';
import 'package:FinLit/stockmarket_pages/fullchart.dart';
import 'package:FinLit/stockmarket_pages/hilo_open_close_chart.dart';
import 'package:flutter/material.dart';

class ViewStock extends StatefulWidget {
  final StockModel stock;
  final double money;

  ViewStock({this.stock, this.money = 500000.00});

  @override
  _ViewStockState createState() =>
      _ViewStockState(money: this.money, stocks: this.stock);
}

class _ViewStockState extends State<ViewStock> {
  Timer _timer;
  double money;
  StockModel stocks;
  final TextEditingController controller = TextEditingController();

  _ViewStockState({this.money, this.stocks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.stock.symbol),
        centerTitle: true,
        backgroundColor: Color(0xFF5433FF),
        actions: [
          IconButton(
            tooltip: "Add to watchlist",
            icon: Icon(Icons.add),
            color: Colors.white,
            highlightColor: Colors.black,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  _timer = Timer(Duration(milliseconds: 500), () {
                    Navigator.of(context).pop();
                  });
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 16,
                    child: Container(
                      height: 100,
                      width: 360.0,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Text(
                          "${widget.stock.symbol} has been added to your Watchlist.",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) {
                if (_timer.isActive) _timer.cancel();
              });
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                    // height: MediaQuery.of(context).size.height / 2,
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
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: 120,
                                  child: Text(widget.stock.symbol,
                                      style: TextStyle(
                                        fontFamily: "Inter-Medium",
                                        color: Colors.white,
                                      ))),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: 120,
                                  child: Text(
                                      "\$${num.parse(widget.stock.price).toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontFamily: "Inter-Medium",
                                        color: Colors.white,
                                      ))),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: 120,
                                  child: Text(widget.stock.name,
                                      style: TextStyle(
                                        fontFamily: "Inter-Medium",
                                        color: Colors.white,
                                      ))),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  width: 120,
                                  child: Text(
                                      "${num.parse(widget.stock.change).toStringAsFixed(2)}(${num.parse(widget.stock.changePercent.substring(0, widget.stock.changePercent.length - 1)).toStringAsFixed(2)}%)",
                                      style: TextStyle(
                                        fontFamily: "Inter-Medium",
                                        color: Colors.white,
                                      ))),
                            ],
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height / 2,
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: HiloOpenCloseChart()),
                        Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: ButtonTheme(
                            minWidth: 400.0,
                            height: 30.0,
                            child: RaisedButton(
                              // elevation: 5,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullChart(
                                            title: widget.stock.name)));
                              },
                              child: Text(
                                "View Full Chart",
                                style: TextStyle(
                                  color: Color(0xFF5433FF),
                                  fontFamily: "Inter-Regular",
                                  fontSize: 16.0,
                                ),
                                maxLines: 1,
                              ),
                              color: Colors.white,
                              splashColor: Colors.grey[300],
                              highlightColor: Colors.grey[400],
                              padding: EdgeInsets.fromLTRB(75, 10, 75, 10),
                              // minWidth: 250.0,
                              // height: 50.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                      ],
                    )),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width: MediaQuery.of(context).size.width / 2,
                  child: ButtonTheme(
                    minWidth: 50.0,
                    height: 30.0,
                    child: RaisedButton(
                      // elevation: 5,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              elevation: 16,
                              child: Container(
                                height: 400,
                                width: 360.0,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 30, 20, 20),
                                        child: Container(
                                          child: Text(
                                            "Your virtual money:",
                                            style: TextStyle(
                                              color: Colors.grey[800],
                                              fontFamily: "Inter-Medium",
                                              fontSize: 18.0,
                                              letterSpacing: 0.4,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          child: Text(
                                        "\$${money.toStringAsFixed(2)}",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: "Inter-Medium",
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.4,
                                        ),
                                      )),
                                      Container(
                                          margin: EdgeInsets.fromLTRB(
                                              20, 50, 20, 20),
                                          child: Container(
                                              width: 500,
                                              child: TextField(
                                                controller: controller,
                                                onChanged: (String txt) {},
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            25, 8, 8, 8),
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xFF5433FF)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                    hintText:
                                                        "Enter number of stocks",
                                                    hintStyle: TextStyle(
                                                      color: Colors.black38,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                    )),
                                              ))),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: ButtonTheme(
                                            minWidth: 300,
                                            height: 50,
                                            child: RaisedButton(
                                                onPressed: () {
                                                  controller.text = "";
                                                  Navigator.of(context).pop();
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      _timer = Timer(
                                                          Duration(
                                                              milliseconds:
                                                                  500), () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                      return Dialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                        elevation: 16,
                                                        child: Container(
                                                          height: 75,
                                                          width: 360.0,
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(20,
                                                                    25, 20, 20),
                                                            child: Text(
                                                              "Awesome!",
                                                              style: TextStyle(
                                                                  fontSize: 24,
                                                                  fontFamily:
                                                                      "Inter-Medium",
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                              maxLines: 2,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) {
                                                    if (_timer.isActive)
                                                      _timer.cancel();
                                                  });
                                                },
                                                child: Text(
                                                  "CONFIRM",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Inter-Regular",
                                                    fontSize: 16.0,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                                color: Colors.green[300],
                                                splashColor: Colors.green[700],
                                                highlightColor:
                                                    Colors.green[800],
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5),
                                                // minWidth: 250.0,
                                                // height: 50.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)))),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: ButtonTheme(
                                            minWidth: 300,
                                            height: 50,
                                            child: RaisedButton(
                                                onPressed: () {
                                                  controller.text = "";
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "CANCEL",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Inter-Regular",
                                                    fontSize: 16.0,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                                color: Colors.red[400],
                                                splashColor: Colors.red[700],
                                                highlightColor: Colors.red[800],
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5),
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
                            );
                          },
                        );
                      },
                      child: Text(
                        "BUY STOCKS",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inter-Regular",
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                      ),
                      color: Colors.green[300],
                      splashColor: Colors.green[700],
                      highlightColor: Colors.green[800],
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      // minWidth: 250.0,
                      // height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                Expanded(
                  // child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 8, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1.8), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                                                      child: Container(
                                child: Container(
                                    child: Text(
                              "Stats",
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: "Inter-Medium",
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ))),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 10, 2),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "OPEN",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.open).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "HIGH",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            letterSpacing: 0.4,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.high).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "52 WK HIGH",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            letterSpacing: 0.4,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          widget.stock.week52High,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "VOLUME",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            letterSpacing: 0.4,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          widget.stock.volume,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "CHANGE",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.change).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 2),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "PRICE",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.price).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "LOW",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.low).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "52 WK LOW",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            letterSpacing: 0.4,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          widget.stock.week52Low,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "PREV CLOSE",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            letterSpacing: 0.4,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.prevClose).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "CHANGE %",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            letterSpacing: 0.4,
                                            fontFamily: "Inter-Medium",
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          "${num.parse(widget.stock.changePercent.substring(0, widget.stock.changePercent.length - 1)).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  // )
                ),
                // Container(
                //   child: Text("Hello world")
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
