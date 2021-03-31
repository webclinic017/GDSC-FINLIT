import 'package:FinLit/pages/loading.dart';
import 'package:FinLit/pages/stockmarket.dart';
import 'package:flutter/material.dart';
import 'package:FinLit/authentication/authenticate.dart';
import 'package:FinLit/authentication/users.dart';
import 'package:FinLit/pages/home.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      // return Loading(toHome: true);
      // return StockMarket();
      return Home();
    }
  }
}