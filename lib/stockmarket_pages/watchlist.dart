import 'package:FinLit/models/stockmodel.dart';
import 'package:FinLit/stockmarket_pages/viewstock.dart';
import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {
  List<StockModel> stocks;
  List<StockModel> results = [];

  Watchlist(this.stocks);

  @override
  _WatchlistState createState() =>
      _WatchlistState(stocks: this.stocks, results: this.results);
}

class _WatchlistState extends State<Watchlist> {
  final TextEditingController controller = TextEditingController();

  List<StockModel> stocks;
  List results;
  _WatchlistState({this.stocks, this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              color: Colors.indigoAccent,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: TextField(
                controller: controller,
                onChanged: filterStocks,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 8, 8, 8),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Search Stocks",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontFamily: "Inter-Medium",
                    )),
              )),
          Expanded(
              child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Container(
                child: Container(
                  child: results.length != 0 || controller.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: widget.results.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewStock(
                                            stock: widget.results[index])));
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
                                                  widget.results[index].symbol,
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16))),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                  "\$${num.parse(widget.results[index].price).toStringAsFixed(2)}",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14)))
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  widget.results[index].name,
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14))),
                                          Container(
                                              child: Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                    "${num.parse(widget.results[index].price).toStringAsFixed(2)}",
                                                    style: TextStyle(
                                                        height: 1.4,
                                                        fontFamily:
                                                            "Inter-Medium",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14)),
                                                Text(
                                                    "(${num.parse(widget.results[index].changePercent.substring(0, widget.results[index].changePercent.length - 1)).toStringAsFixed(2)}%)",
                                                    style: TextStyle(
                                                        color: widget
                                                                        .stocks[
                                                                            index]
                                                                        .changePercent[
                                                                    0] ==
                                                                '-'
                                                            ? Colors.red
                                                            : Colors.green,
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
                          })
                      : ListView.builder(
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
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 16))),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                  "\$${num.parse(widget.stocks[index].price).toStringAsFixed(2)}",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      height: 1.4,
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14)))
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
                                                      fontFamily:
                                                          "Inter-Medium",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14))),
                                          Container(
                                              child: Container(
                                            child: Row(
                                              children: [
                                                Text("${num.parse(widget.stocks[index].change).toStringAsFixed(2)}",
                                                    style: TextStyle(
                                                        height: 1.4,
                                                        fontFamily:
                                                            "Inter-Medium",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14)),
                                                Text(
                                                    "(${num.parse(widget.stocks[index].changePercent.substring(0, widget.stocks[index].changePercent.length - 1)).toStringAsFixed(2)}%)",
                                                    style: TextStyle(
                                                        color: widget
                                                                        .stocks[
                                                                            index]
                                                                        .changePercent[
                                                                    0] ==
                                                                '-'
                                                            ? Colors.red
                                                            : Colors.green,
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
                          }),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  void filterStocks(String txt) async {
    // if (results != null) results.clear();
    results.clear();
    if (txt.isEmpty) {
      setState(() {});
      return;
    }

    stocks.forEach((e) {
      if (e.symbol.contains(txt.toUpperCase()) ||
          e.name.toUpperCase().contains(txt.toUpperCase())) {
        // print(e.name);
        results.add(e);
        // print(results);
      }
    });
    setState(() {});
  }
}
