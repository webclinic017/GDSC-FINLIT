import 'package:FinLit/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionHistory extends StatefulWidget {
  List<Transaction> transactions;

  TransactionHistory({this.transactions});
  @override
  _TransactionHistoryState createState() =>
      _TransactionHistoryState(transactions: transactions);
}

class _TransactionHistoryState extends State<TransactionHistory> {
  List<Transaction> transactions = [];
  _TransactionHistoryState({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Container(
          child: Container(
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.transactions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("clicked");
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
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                    child: Container(
                                      child: Text(
                                        "Transaction Details",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: "Inter-Medium",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Status",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].status}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Stock Symbol",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].symbol}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Company",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].name}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Number of Stocks",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].stock_count}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          transactions[index].status == "sold" ? "Selling Price" : "Last Traded Price",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          transactions[index].status == "sold" ? "${transactions[index].selling_price}" : "${transactions[index].last_traded_price}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Date",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].date}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                            fontFamily: "Inter-Regular",
                                            color: Colors.white,
                                          ),
                                        ),
                                        color: Color(0xFF536DFE),
                                        splashColor: Color(0xFF647FFF),
                                        highlightColor: Color(0xFF647FFF),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 5),
                  child: InkWell(
                    onTap: () {
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
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                                    child: Container(
                                      child: Text(
                                        "Transaction Details",
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: "Inter-Medium",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Status",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].status}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Stock Symbol",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].symbol}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Company",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].name}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Number of Stocks",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].stock_count}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          transactions[index].status == "sold" ? "Selling Price" : "Last Traded Price",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          transactions[index].status == "sold" ? "${transactions[index].selling_price}" : "${transactions[index].last_traded_price}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            child: Text(
                                          "Date",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Medium",
                                            fontSize: 16.0,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                        Container(
                                            child: Text(
                                          "${transactions[index].date}",
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontFamily: "Inter-Regular",
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.4,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Ok",
                                          style: TextStyle(
                                            fontFamily: "Inter-Regular",
                                            color: Colors.white,
                                          ),
                                        ),
                                        color: Color(0xFF536DFE),
                                        splashColor: Color(0xFF647FFF),
                                        highlightColor: Color(0xFF647FFF),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    splashColor: Colors.black12,
                    highlightColor: Colors.black12,
                    child: Ink(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey[300], width: 1)),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text("${transactions[index].symbol}",
                                        style: TextStyle(
                                            height: 1.4,
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16))),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        // "\$${num.parse(widget.stocks[index].price).toStringAsFixed(2)}",
                                        "${transactions[index].status.toUpperCase()}",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            height: 1.4,
                                            color: Colors.grey[500],
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14)))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                        // widget.stocks[index].name,
                                        "${transactions[index].name}",
                                        style: TextStyle(
                                            height: 1.4,
                                            fontFamily: "Inter-Medium",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14))),
                                Container(
                                    child: Container(
                                  child: Text(
                                      // "${num.parse(widget.stocks[index].change).toStringAsFixed(2)}",
                                      transactions[index].status != "sold"
                                          ? "-${transactions[index].last_traded_price}"
                                          : "+${transactions[index].selling_price}",
                                      style: TextStyle(
                                          color: transactions[index].status !=
                                                  "sold"
                                              ? Colors.red[400]
                                              : Color(0xFF4CAF50),
                                          height: 1.4,
                                          fontFamily: "Inter-Medium",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ))
                              ]),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                      "${transactions[index].date}",
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          height: 1.4,
                                          fontFamily: "Inter-Medium",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                  Text(
                                      "See details",
                                      style: TextStyle(
                                          color: Colors.blue[400],
                                          height: 1.4,
                                          fontFamily: "Inter-Medium",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                              
                              ])
                        ])),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
