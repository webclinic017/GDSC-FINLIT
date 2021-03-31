/// Dart import
import 'dart:async';
import 'dart:math' as math;
import 'dart:math';
import 'package:FinLit/models/stockmodel.dart';
import 'package:FinLit/stockmarket_pages/viewstock.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:FinLit/models/sample_view.dart';

/// Renders real time value change data grid
class RealTimeUpdateDataGrid extends SampleView {

  List _symbols;
  RealTimeUpdateDataGrid(this._symbols);

  @override
  _RealTimeUpdateDataGridPageState createState() =>
      _RealTimeUpdateDataGridPageState(_symbols);
}

List<_Stock> _stockData;

class _RealTimeUpdateDataGridPageState extends SampleViewState {
  
  List _symbols;
  _RealTimeUpdateDataGridPageState(this._symbols);

  

  final math.Random _random = math.Random();

  final _RealTimeUpdateDataGridSource _realTimeUpdateDataGridSource =
      _RealTimeUpdateDataGridSource();

  Timer _timer;
  bool _isLandscapeInMobileView;

  final Map<double, Image> _images = <double, Image>{
    1: Image.asset(
      'assets/images/Uparrow.png',
      width: 15,
      height: 15,
    ),
    0: Image.asset(
      'assets/images/Downarrow.png',
      width: 15,
      height: 15,
    ),
  };

  final List<double> _stocks = <double>[
    -0.76,
    0.3,
    0.42,
    0.12,
    0.55,
    -0.78,
    0.68,
    0.99,
    0.31,
    -0.8,
    -0.99,
    0.43,
    -0.5,
    0.84 - 0.84,
    0.18,
    -0.71,
    -0.94
  ];

  // final List<String> _symbols = <String>[
  //   'OJEC',
  //   'PUYU',
  //   'EXTB',
  //   'QBLI',
  //   'SFIO',
  //   'MIXR',
  //   'KQOW',
  //   'DSHN',
  //   'ZATR',
  //   'SFBK',
  //   'FLRT',
  //   'PHKH',
  //   'XRDZ',
  //   'QSGB',
  //   'XEMM',
  //   'ORTC',
  //   'ICGC',
  //   'NLGV',
  //   'TJXR',
  //   'HNDZ',
  //   'XMXT',
  //   'JKLN',
  //   'INEP',
  //   'RSTU',
  //   'THLF',
  //   'MHRE',
  //   'YZGO',
  //   'ZNNT',
  //   'QWIC',
  //   'XTNF',
  //   'PXNZ',
  //   'CTNR',
  //   'MXQN',
  //   'HBMR',
  //   'EPAF',
  //   'RTES',
  //   'RCOT',
  //   'BMQX',
  //   'OULN',
  //   'RRZR',
  //   'NRVV',
  //   'PFWE',
  //   'HFTB',
  // ];

  List<_Stock> _generateList(int count) {
    final List<_Stock> stockData = <_Stock>[];
    for (int i = 1; i < _symbols.length; i++) {
      stockData.add(_Stock(
          _symbols[i],
          _stocks[_random.nextInt(_stocks.length - 1)],
          2.0 + _random.nextInt(15),
          12.0 + _random.nextInt(20),
          50 + _random.nextInt(20)));
    }
    return stockData;
  }

  @override
  void initState() {
    super.initState();

    _stockData = _generateList(100);
    _timer = Timer.periodic(const Duration(milliseconds: 200), (Timer args) {
      timerTick(args);
    });
  }

  void timerTick(Timer args) {
    _changeRows(100);
  }

  void _changeRows(int count) {
    if (_stockData.length < count) {
      count = _stockData.length;
    }

    for (int i = 0; i < count; ++i) {
      final int recNo = _random.nextInt(_stockData.length - 1);

      _stockData[recNo].stock = _stocks[(_random.nextInt(_stocks.length - 1))];
      _realTimeUpdateDataGridSource.updateDataSource(
          rowColumnIndex: RowColumnIndex(recNo, 1));

      _stockData[recNo].open = 50.0 + _random.nextInt(40);
      _realTimeUpdateDataGridSource.updateDataSource(
          rowColumnIndex: RowColumnIndex(recNo, 2));

      _stockData[recNo].previousClose = 50.0 + _random.nextInt(30);
      _realTimeUpdateDataGridSource.updateDataSource(
          rowColumnIndex: RowColumnIndex(recNo, 3));

      _stockData[recNo].lastTrade = 50 + _random.nextInt(20);
      _realTimeUpdateDataGridSource.updateDataSource(
          rowColumnIndex: RowColumnIndex(recNo, 4));
    }
  }

  SfDataGrid _dataGridSample() {
    return SfDataGrid(
      onCellTap: (DataGridCellTapDetails x) {
        StockModel sample = StockModel(
          symbol: "AZUKI",
        name: "AZUKI Inc.",
        price: "845.1800",
        open: "404.9600",
        high: "845.8400",
        low: "401.6300",
        prevClose: "604.7900",
        volume: "4397360",
        change: "4.3900",
        changePercent: "8.3900%",
        week52High: (50 + Random().nextInt(48)).toString(),
        week52Low: (4 + Random().nextInt(15)).toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewStock(stock: sample)));
        
      },
      source: _realTimeUpdateDataGridSource,
      allowSorting: true,
      cellBuilder: (BuildContext context, GridColumn column, int rowIndex) {
        if (column.mappingName == 'stock') {
          final double stock = _stockData[rowIndex].stock;
          return stock >= 0.5
              ? _getWidget(_images[1], stock)
              : _getWidget(_images[0], stock);
        } else {
          return null;
        }
      },
      columnWidthMode: ColumnWidthMode.header,
      columns: <GridColumn>[
        GridTextColumn(
            allowSorting: true,
            mappingName: 'symbol',
            headerText: 'Symbol',
            headerTextAlignment: Alignment.center,
            textAlignment: Alignment.center),
        GridWidgetColumn(
          allowSorting: false,
            mappingName: 'stock',
            headerText: 'Stock',
            headerTextAlignment: Alignment.center,
            textAlignment: Alignment.center),
        GridNumericColumn(
          allowSorting: false,
            mappingName: 'open',
            headerText: ' Change(%)',
            headerTextAlignment: Alignment.center,
            textAlignment: Alignment.center),
        GridNumericColumn(
          allowSorting: false,
            mappingName: 'previousClose',
            headerText: 'Previous Close',
            headerTextAlignment: Alignment.center,
            textAlignment: Alignment.center),
        GridNumericColumn(
          allowSorting: false,
            mappingName: 'lastTrade',
            headerText: 'Last Trade',
            headerTextAlignment: Alignment.center,
            textAlignment: Alignment.center),
      ],
    );
  }

  Widget _getWidget(Image image, double stack) {
    return Container(
      padding: const EdgeInsets.all(4),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(child: image),
          const SizedBox(
            width: 6.0,
          ),
          Flexible(
            child: Text(
              stack.toString(),
              textScaleFactor: 1.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isLandscapeInMobileView =
        MediaQuery.of(context).orientation == Orientation.landscape;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello world")
      // ),
      body: Container(
        // child: SingleChildScrollView(
        // physics: ClampingScrollPhysics(),
        child: Container(child: _dataGridSample()),
        // ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

class _Stock {
  _Stock(
      this.symbol, this.stock, this.open, this.previousClose, this.lastTrade);
  String symbol;
  double stock;
  double open;
  double previousClose;
  int lastTrade;
}

class _RealTimeUpdateDataGridSource extends DataGridSource<_Stock> {
  _RealTimeUpdateDataGridSource();
  @override
  List<_Stock> get dataSource => _stockData;
  @override
  Object getValue(_Stock _stock, String columnName) {
    switch (columnName) {
      case 'symbol':
        return _stock.symbol;
        break;
      case 'open':
        return _stock.open;
        break;
      case 'previousClose':
        return _stock.previousClose;
        break;
      case 'lastTrade':
        return _stock.lastTrade;
        break;
      default:
        return 'empty';
        break;
    }
  }

  void updateDataSource({RowColumnIndex rowColumnIndex}) {
    notifyDataSourceListeners(rowColumnIndex: rowColumnIndex);
  }
}
