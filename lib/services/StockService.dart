import 'dart:convert';
import 'dart:math';

import 'package:FinLit/models/stockmodel.dart';
import 'package:http/http.dart' as http;

class StockService {
  List<StockModel> stocks = List<StockModel>();

  StockService();

  getData() async {
    List<String> symbols = [
      "AAPL",
      "IBM",
      "NFLX",
      "ABM",
      "GOOGL",
      "FB",
      "AMZN",
      "INTC",
      "HPQ"
    ];

    StockModel sm = StockModel(
        symbol: "IBM",
        name: "IBM",
        price: "128.9000",
        open: "130.0200",
        high: "130.4400",
        low: "128.5300",
        prevClose: "130.0600",
        volume: "9844983",
        change: "-1.1600",
        changePercent: "-0.8919%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm);

    StockModel sm2 = StockModel(
        symbol: "NFLX",
        name: "Netflix Inc.",
        price: "512.1800",
        open: "504.9600",
        high: "513.1900",
        low: "501.6300",
        prevClose: "504.7900",
        volume: "4386360",
        change: "7.3900",
        changePercent: "7.3900%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm2);

    StockModel sm3 = StockModel(
        symbol: "GOOGL",
        name: "Google Inc.",
        price: "2026.9600",
        open: "2029.7300",
        high: "2037.0400",
        low: "2002.9300",
        prevClose: "2021.3400",
        volume: "2303596",
        change: "5.6200",
        changePercent: "0.2780%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm3);

    StockModel sm1 = StockModel(
        symbol: "AAPL",
        name: "Apple Inc.",
        price: "128.9000",
        open: "119.9000",
        high: "121.4300",
        low: "119.6750",
        prevClose: "120.5300",
        volume: "9844983",
        change: "-0.5400",
        changePercent: "-0.4480%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm1);

    StockModel sm4 = StockModel(
        symbol: "FB",
        name: "Facebook Inc.",
        price: "290.1100",
        open: "281.2200",
        high: "292.8000",
        low: "281.1950",
        prevClose: "278.6200",
        volume: "38930536",
        change: "11.4900",
        changePercent: "11.4900%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm4);

    StockModel sm5 = StockModel(
        symbol: "ABM",
        name: "ABM Industries",
        price: "128.9000",
        open: "50.2100",
        high: "50.70000",
        low: "48.6500",
        prevClose: "50.2600",
        volume: "1008377",
        change: "0.1300",
        changePercent: "0.2587%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm5);

    StockModel sm6 = StockModel(
        symbol: "AMZN",
        name: "Amazon.com, Inc.",
        price: "3074.9600",
        open: "3029.2300",
        high: "3077.2850",
        low: "3016.6300",
        prevClose: "3027.9900",
        volume: "4625354",
        change: "46.9700",
        changePercent: "1.5512",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm6);

    StockModel sm7 = StockModel(
        symbol: "INTC",
        name: "Intel Inc.",
        price: "63.7600",
        open: "63.1800",
        high: "64.9900",
        low: "62.9200",
        prevClose: "63.7250",
        volume: "54951650",
        change: "0.0350",
        changePercent: "0.0549%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm7);

    StockModel sm8 = StockModel(
        symbol: "HPQ",
        name: "HP Inc.",
        price: "30.0800",
        open: "30.0400",
        high: "30.3200",
        low: "29.6800",
        prevClose: "30.3100",
        volume: "49810624",
        change: "-0.2300",
        changePercent: "-0.7588%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm8);

    StockModel sm9 = StockModel(
        symbol: "MSFT",
        name: "Microsoft Corporation",
        price: "230.3500",
        open: "231.0200",
        high: "232.4740",
        low: "229.3496",
        prevClose: "230.7200",
        volume: "46430730",
        change: "0.3700",
        changePercent: "-0.1604%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm9);

    StockModel sm10 = StockModel(
        symbol: "ABNB",
        name: "Airbnb Inc.",
        price: "194.3900",
        open: "193.0100",
        high: "196.4900",
        low: "187.8100",
        prevClose: "191.4500",
        volume: "4444583",
        change: "2.9400",
        changePercent: "1.5356%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
    stocks.add(sm10);
  }

  List<StockModel> getAllData() {
    getData();

    return stocks;
  }
}
