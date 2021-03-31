// todo
// todo

import 'package:FinLit/models/stockmodel.dart';
import 'package:FinLit/models/transaction.dart';
import 'package:FinLit/pages/home.dart';
import 'package:FinLit/services/getTransactions.dart';
import 'package:FinLit/stockmarket_pages/datagrid_real_time_update.dart';
import 'package:FinLit/stockmarket_pages/hilo_open_close_chart.dart';
import 'package:FinLit/stockmarket_pages/portfolio.dart';
import 'package:FinLit/stockmarket_pages/profile.dart';
import 'package:FinLit/stockmarket_pages/stocks.dart';
import 'package:FinLit/stockmarket_pages/transactionpage.dart';
import 'package:FinLit/stockmarket_pages/viewstock.dart';
import 'package:FinLit/stockmarket_pages/watchlist.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:FinLit/services/StockService.dart' show StockService;

class StockMarket extends StatefulWidget {
  @override
  _StockMarketState createState() => _StockMarketState();
}

class _StockMarketState extends State<StockMarket> {
  int _selectedIndex = 0;

  String getTitle() {
    if (_selectedIndex == 0)
      return "Watchlist";
    else if (_selectedIndex == 1)
      return "Stocks";
    else if (_selectedIndex == 2)
      return "Portfolio";
    else if (_selectedIndex == 3)
      return "Transactions";
    else
      return "Profile";
  }

  Widget getTab() {
    if (_selectedIndex == 0) {
      StockService ss = StockService();
      List<StockModel> retval = ss.getAllData();
      return Watchlist(retval);
    }
    else if (_selectedIndex == 1)
      return Stocks();
    else if (_selectedIndex == 2) {
      StockService ss = StockService();
      List<StockModel> retval = ss.getAllData();
      retval = retval.take(6).toList().reversed.toList();
      return Portfolio(stocks: retval);

    }
    else if (_selectedIndex == 3) {
      // return Container(child: Text("Transactions"));
      TransactionService ts = TransactionService();
      List<Transaction> retval = ts.getAllTransactions();
      print(retval);
      return TransactionHistory(transactions: retval);
    }
    else if (_selectedIndex == 4) {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HiloOpenCloseChart()));
      // return Container(child: Text("Profile"));
      return StockProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
            Text(getTitle(), 
            style: TextStyle(fontFamily: "Inter-Semibold")),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_rounded),
            label: 'Watchlist',
            backgroundColor: Colors.indigoAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_sharp),
            label: 'Stocks',
            backgroundColor: Colors.indigoAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait_rounded),
            label: 'Portfolio',
            backgroundColor: Colors.indigoAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Transactions',
            backgroundColor: Colors.indigoAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
            backgroundColor: Colors.indigoAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF66FCB4),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: getTab()
      // body: HiloOpenCloseChart()
    );
  }
}
