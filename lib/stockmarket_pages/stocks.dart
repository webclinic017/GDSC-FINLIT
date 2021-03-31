import 'package:FinLit/stockmarket_pages/datagrid_real_time_update.dart';
import 'package:flutter/material.dart';

class Stocks extends StatefulWidget {
  final List results = [];
  final List<String> _symbols = <String>[
    // 'OJEC',
    // 'PUYU',
    // 'EXTB',
    // 'QBLI',
    // 'SFIO',
    // 'MIXR',
    // 'KQOW',
    // 'DSHN',
    // 'ZATR',
    // 'SFBK',
    // 'FLRT',
    // 'PHKH',
    // 'XRDZ',
    // 'QSGB',
    // 'XEMM',
    // 'ORTC',
    // 'ICGC',
    // 'NLGV',
    // 'TJXR',
    // 'HNDZ',
    // 'XMXT',
    // 'JKLN',
    // 'INEP',
    // 'RSTU',
    // 'THLF',
    // 'MHRE',
    // 'YZGO',
    // 'ZNNT',
    // 'QWIC',
    // 'XTNF',
    // 'PXNZ',
    // 'CTNR',
    // 'MXQN',
    // 'HBMR',
    // 'EPAF',
    // 'RTES',
    // 'RCOT',
    // 'BMQX',
    // 'OULN',
    // 'RRZR',
    // 'NRVV',
    // 'PFWE',
    // 'HFTB',
    'IBM',
    'NFLX',
    'GOOGLE',
    'AAPL',
    'FB',
    'ABM',
    'AMZN',
    'INTC',
    'HPQ',
    'MSFT',
    'ABNB',
    'IBM',
    'NFLX',
    'GOOGLE',
    'AAPL',
    'FB',
    'ABM',
    'AMZN',
    'INTC',
    'HPQ',
    'MSFT',
    'ABNB',
    'IBM',
    'NFLX',
    'GOOGLE',
    'AAPL',
    'FB',
    'ABM',
    'AMZN',
    'INTC',
    'HPQ',
    'MSFT',
    'ABNB',
  ];

  @override
  _StocksState createState() => _StocksState(results, _symbols);
}

class _StocksState extends State<Stocks> {
  TextEditingController controller = TextEditingController();

  List results;
  List _symbols;
  _StocksState(this.results, this._symbols);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
              // FlatButton(onPressed: () {
              //   _symbols.add("WTF");
              //   setState(() {}

              //   );
              // }, child: Text("hello world")),
              Container(
                  height: MediaQuery.of(context).size.height,
                  child: results.length != 0 || controller.text.isNotEmpty
                      ? RealTimeUpdateDataGrid(results)
                      : RealTimeUpdateDataGrid(_symbols)
                  // ? Container(child: Text("wtf"))
                  // : Container(child: Text("empty"))
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void filterStocks(String txt) async {
    // print(txt);
    // print(_symbols);
    results.clear();
    if (txt.isEmpty) {
      // WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
      this.setState(() {});
      return;
    }

    _symbols.forEach((e) {
      if (e.contains(txt.toUpperCase())) {
        // print(e);
        results.add(e);
        // print(results);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => this.setState(() {}));
  }
}
