class Transaction {
  String status;
  String stock_count;
  String name;
  String symbol;
  String date;
  String bought_price;
  String selling_price; // if sold
  String last_traded_price; // if bought

  Transaction({this.status, this.stock_count, this.name, this.symbol, this.bought_price, this.date, this.last_traded_price = "", this.selling_price = ""});

}