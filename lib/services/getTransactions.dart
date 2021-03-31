import 'package:FinLit/models/transaction.dart';

class TransactionService {
  List<Transaction> transactions = [];

  TransactionService();

  void addAllTransaction() {
    Transaction t1 = Transaction(
        status: "sold",
        stock_count: "5",
        name: "Amazon.com, Inc",
        symbol: "AMZN",
        date: "March 17, 2019 7:10 pm",
        bought_price: "3137.5",
        selling_price: "3132.82");
    Transaction t2 = Transaction(
        status: "bought",
        stock_count: "10",
        name: "Apple Inc.",
        symbol: "AAPL",
        date: "Dec 25, 2020 12:30 am",
        bought_price: "122.54",
        last_traded_price: "122.21");
    Transaction t3 = Transaction(
        status: "bought",
        stock_count: "100",
        name: "ABM Industries Inc.",
        symbol: "ABM",
        date: "Feb 20, 2020 1:27 pm",
        bought_price: "49.23",
        last_traded_price: "50.00");
    Transaction t4 = Transaction(
        status: "sold",
        stock_count: "20",
        name: "Google Inc.",
        symbol: "GOOGL",
        date: "Jan 21, 2021 5:49 pm",
        bought_price: "2041.33",
        selling_price: "2070.42");
    Transaction t5 = Transaction(
        status: "bought",
        stock_count: "200",
        name: "IBM Corp.",
        symbol: "IBM",
        date: "Feb 24, 2021 10:00am",
        bought_price: "130.46",
        last_traded_price: "131.72");

        transactions.add(t1);
        transactions.add(t2);
        transactions.add(t3);
        transactions.add(t4);
        transactions.add(t5);
  }

  List<Transaction> getAllTransactions() {
    addAllTransaction();
    return transactions;
  }
}
