import 'dart:async';
import 'dart:math';

import 'package:FinLit/models/stockmodel.dart';
import 'package:FinLit/services/StockService.dart';
import 'package:FinLit/stockmarket_pages/viewstock.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Portfolio extends StatefulWidget {
  List<StockModel> stocks;

  Portfolio({this.stocks});

  @override
  _PortfolioState createState() => _PortfolioState(stocks: this.stocks);
}

class _PortfolioState extends State<Portfolio> {
  List<StockModel> stocks;
  final String money = "74522.72";
  Timer _timer;
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  _PortfolioState({this.stocks});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              color: Colors.indigoAccent,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Stack(overflow: Overflow.visible, children: [
                Positioned(
                  bottom: -80,
                  right: 0,
                  // top: 65
                  child: Container(
                      // margin: EdgeInsets.fromLTRB(10, 20, 20, 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1.5,
                            blurRadius: 1,
                            offset:
                                Offset(0, 1.8), // changes position of shadow
                          ),
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(30, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                            width: 500,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[400], width: 1))),
                            child: Text(
                              "\$74,522.72",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: "Inter-Medium",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 5),
                              Container(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.attach_money_rounded,
                                        color: Colors.pink,
                                        size: 28.0,
                                      ),
                                      Text("\$39,940.96",
                                          style: TextStyle(
                                              fontFamily: "Inter-Regular",
                                              fontSize: 14))
                                    ],
                                  )),
                              Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.multiline_chart_rounded,
                                        color: Colors.pink,
                                        size: 28.0,
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("\$34,581.76",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Inter-Regular",
                                                  fontSize: 14)),
                                          Text("3.85 (0.76%)",
                                              style: TextStyle(
                                                  fontFamily: "Inter-Medium",
                                                  color: Color(0xFF4CDF50),
                                                  fontSize: 14)),
                                        ],
                                      )
                                    ],
                                  )),
                              SizedBox(width: 2),
                            ],
                          )
                        ],
                      )),
                )
              ])),
          SizedBox(height: 60),
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
                          height: 500,
                          width: 360.0,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
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
                                  "\$${num.parse(money).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontFamily: "Inter-Medium",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.4,
                                  ),
                                )),
                                Container(
                                    margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
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
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF5433FF)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              hintText:
                                                  "Enter stock symbol",
                                              hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: "Inter-Medium",
                                              )),
                                        ))),
                                Container(
                                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                    child: Container(
                                        width: 500,
                                        child: TextField(
                                          controller: controller2,
                                          onChanged: (String txt) {},
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      25, 8, 8, 8),
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                borderSide: BorderSide(
                                                    color: Color(0xFF5433FF)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                borderSide: BorderSide(
                                                    color: Colors.black),
                                              ),
                                              hintText:
                                                  "Enter number of stocks",
                                              hintStyle: TextStyle(
                                                color: Colors.black38,
                                                fontFamily: "Inter-Medium",
                                              )),
                                        ))),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: ButtonTheme(
                                      minWidth: 300,
                                      height: 50,
                                      child: RaisedButton(
                                          onPressed: () {
                                            controller2.text = "";
                                            controller.text = "";
                                            Navigator.of(context).pop();
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                _timer = Timer(
                                                    Duration(milliseconds: 500),
                                                    () {
                                                  Navigator.of(context).pop();
                                                });
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40)),
                                                  elevation: 16,
                                                  child: Container(
                                                    height: 75,
                                                    width: 360.0,
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              20, 25, 20, 20),
                                                      child: Text(
                                                        "Successfully Sold!",
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontFamily:
                                                                "Inter-Medium",
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
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
                                          highlightColor: Colors.green[800],
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          // minWidth: 250.0,
                                          // height: 50.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)))),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: ButtonTheme(
                                      minWidth: 300,
                                      height: 50,
                                      child: RaisedButton(
                                          onPressed: () {
                                            controller2.text = "";
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
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          // minWidth: 250.0,
                                          // height: 50.0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0)))),
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
                  "SELL STOCKS",
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
            child: Container(
                child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: widget.stocks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewStock(
                                          stock: widget.stocks[index])));
                            },
                            child: Container(
                                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey[300], width: 1)),
                                ),
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Column(children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                widget.stocks[index].symbol,
                                                style: TextStyle(
                                                    height: 1.4,
                                                    fontFamily: "Inter-Medium",
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16))),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                                "Php ${widget.stocks[index].price}",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    height: 1.4,
                                                    fontFamily: "Inter-Medium",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14))),
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                widget.stocks[index].name,
                                                style: TextStyle(
                                                    height: 1.4,
                                                    fontFamily: "Inter-Medium",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14))),
                                        Container(
                                            child: Container(
                                          child: Row(
                                            children: [
                                              Text(widget.stocks[index].price,
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14)),
                                              Text(
                                                  "(${widget.stocks[index].changePercent})",
                                                  style: TextStyle(
                                                      color: widget
                                                                  .stocks[index]
                                                                  .changePercent[0] ==
                                                              '-'
                                                          ? Colors.red
                                                          : Colors.green,
                                                      height: 1.4,
                                                      fontFamily: "Inter-Medium",
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14)),
                                            ],
                                          ),
                                        ))
                                      ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                "Bought Price: ${(Random().nextDouble() * (Random().nextInt(500) - Random().nextInt(300)) + Random().nextInt(500)).toStringAsFixed(2)}",
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    height: 1.4,
                                                    fontFamily: "Inter-Medium",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14))),
                                        Container(
                                            child: Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                  "Qty: ${Random().nextInt(50)} | LTP:  ${(Random().nextDouble() * (Random().nextInt(500) - Random().nextInt(300)) + Random().nextInt(500)).toStringAsFixed(2)}",
                                                  style: TextStyle(
                                                      color: Colors.grey[400],
                                                      height: 1.4,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14)),
                                            ],
                                          ),
                                        ))
                                      ]),
                                ])),
                          );
                        }))),
          )
        ],
      ),
    );
  }
}
