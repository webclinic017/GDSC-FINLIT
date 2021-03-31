import 'dart:math';

/// Package imports
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';


import 'package:FinLit/models/sample_view.dart';


class HiloOpenCloseChart extends SampleView {
  
  const HiloOpenCloseChart();

  @override
  _HiloOpenCloseChartState createState() => _HiloOpenCloseChartState();
}

class _HiloOpenCloseChartState extends SampleViewState {
  _HiloOpenCloseChartState();
  bool _toggleVisibility;
  
  @override
  Widget buildSettings(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter stateSetter) {
      return Row(
        children: <Widget>[
          Text('Show indication for\nsame values ',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16,
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 90,
                child: CheckboxListTile(
                    activeColor: Colors.red,
                    value: _toggleVisibility,
                    onChanged: (bool value) {
                      setState(() {
                        _toggleVisibility = value;
                        stateSetter(() {});
                      });
                    }),
              ))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: _getHiloOpenClose()));
  }


  SfCartesianChart _getHiloOpenClose() {
    return SfCartesianChart(
      // margin: EdgeInsets.all(0),
      backgroundColor: Colors.white,
      plotAreaBorderColor: Colors.white,
      plotAreaBackgroundColor: Colors.white,
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView != null ? '' : 'High-Low Stock Chart', textStyle: TextStyle(
        fontFamily: "Inter-Regular",
        fontSize: 14,
        color: Colors.black
      )),
      primaryXAxis: DateTimeAxis(
        labelStyle: TextStyle(
          color: Colors.black
        ),
          dateFormat: DateFormat.MMM(),
          interval: 1,
          intervalType: DateTimeIntervalType.months,
          minimum: DateTime(2016, 01, 01),
          maximum: DateTime(2017, 01, 01),
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(
          color: Colors.black
        ),
          minimum: 140,
          maximum: 60,
          interval: 10,
          labelFormat: '\${value}',
          axisLine: AxisLine(width: 0)),
      series: _getHiloOpenCloseSeries(),
      trackballBehavior: TrackballBehavior(
          enable: true, activationMode: ActivationMode.singleTap),
    );
  }

  num randomNumber(Random source, num f, num s) {
    return source.nextDouble() * (s - f) + f;
  }

  ///Get the hilo open close series
  List<HiloOpenCloseSeries<ChartSampleData, DateTime>>
      _getHiloOpenCloseSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2016, 01, 11),
          open: randomNumber(Random(), 100, 102),
          high: randomNumber(Random(), 100, 102),
          low: randomNumber(Random(), 90, 100),
          close: randomNumber(Random(), 90, 100),),
      ChartSampleData(
          x: DateTime(2016, 01, 18),
          open: 98.41,
          high: 101.46,
          low: 93.42,
          close: 101.42),
      ChartSampleData(
          x: DateTime(2016, 01, 25),
          open: 101.52,
          high: 101.53,
          low: 92.39,
          close: 97.34),
      ChartSampleData(
          x: DateTime(2016, 02, 01),
          open: 96.47,
          high: 97.33,
          low: 93.69,
          close: 94.02),
      ChartSampleData(
          x: DateTime(2016, 02, 08),
          open: 93.13,
          high: 96.35,
          low: 92.59,
          close: 93.99),
      ChartSampleData(
          x: DateTime(2016, 02, 15),
          open: 91.02,
          high: 94.89,
          low: 90.61,
          close: 92.04),
      ChartSampleData(
          x: DateTime(2016, 02, 22),
          open: randomNumber(Random(), 100, 102),
          high: randomNumber(Random(), 100, 102),
          low: randomNumber(Random(), 90, 100),
          close: randomNumber(Random(), 90, 100),),
      ChartSampleData(
          x: DateTime(2016, 02, 29),
          open: 99.86,
          high: 106.75,
          low: 99.65,
          close: 106.01),
      ChartSampleData(
          x: DateTime(2016, 03, 07),
          open: 102.39,
          high: 102.83,
          low: 100.15,
          close: 102.26),
      ChartSampleData(
          x: DateTime(2016, 03, 14),
          open: 101.91,
          high: 106.5,
          low: 101.78,
          close: 105.92),
      ChartSampleData(
          x: DateTime(2016, 03, 21),
          open: 105.93,
          high: 107.65,
          low: 104.89,
          close: 105.67),
      ChartSampleData(
          x: DateTime(2016, 03, 28),
          open: 106,
          high: 110.42,
          low: 104.88,
          close: 109.99),
      ChartSampleData(
          x: DateTime(2016, 04, 04),
          open: 110.42,
          high: 112.19,
          low: 108.121,
          close: 108.66),
      ChartSampleData(
          x: DateTime(2016, 04, 11),
          open: 108.97,
          high: 112.39,
          low: 108.66,
          close: 109.85),
      ChartSampleData(
          x: DateTime(2016, 04, 18),
          open: 108.89,
          high: 108.95,
          low: 104.62,
          close: 105.68),
      ChartSampleData(
          x: DateTime(2016, 04, 25),
          open: 105,
          high: 105.65,
          low: 92.51,
          close: 93.74),
      ChartSampleData(
          x: DateTime(2016, 05, 02),
         open: randomNumber(Random(), 100, 102),
          high: randomNumber(Random(), 100, 102),
          low: randomNumber(Random(), 90, 100),
          close: randomNumber(Random(), 90, 100),),
      ChartSampleData(
          x: DateTime(2016, 05, 09),
          open: 93,
          high: 93.77,
          low: 89.47,
          close: 90.52),
      ChartSampleData(
          x: DateTime(2016, 05, 16),
          open: 92.39,
          high: 95.43,
          low: 91.65,
          close: 95.22),
      ChartSampleData(
          x: DateTime(2016, 05, 23),
          open: 95.87,
          high: 100.73,
          low: 95.67,
          close: 100.35),
      ChartSampleData(
          x: DateTime(2016, 05, 30),
          open: 99.6,
          high: 100.4,
          low: 96.63,
          close: 97.92),
      ChartSampleData(
          x: DateTime(2016, 06, 06),
          open: 97.99,
          high: 101.89,
          low: 97.55,
          close: 98.83),
      ChartSampleData(
          x: DateTime(2016, 06, 13),
          open: 98.69,
          high: 99.12,
          low: 95.3,
          close: 95.33),
      ChartSampleData(
          x: DateTime(2016, 06, 20),
          open: 96,
          high: 96.89,
          low: 92.65,
          close: 93.4),
      ChartSampleData(
          x: DateTime(2016, 06, 27),
         open: randomNumber(Random(), 80, 102),
          high: randomNumber(Random(), 80, 102),
          low: randomNumber(Random(), 80, 90),
          close: randomNumber(Random(), 80, 90),),
      ChartSampleData(
          x: DateTime(2016, 07, 04),
         open: randomNumber(Random(), 80, 102),
          high: randomNumber(Random(), 80, 102),
          low: randomNumber(Random(), 80, 90),
          close: randomNumber(Random(), 80, 90),),
      ChartSampleData(
          x: DateTime(2016, 07, 11),
          open: randomNumber(Random(), 80, 102),
          high: randomNumber(Random(), 80, 102),
          low: randomNumber(Random(), 80, 90),
          close: randomNumber(Random(), 80, 90),),
      ChartSampleData(
          x: DateTime(2016, 07, 18),
          open: 98.7,
          high: 101,
          low: 98.31,
          close: 98.66),
      ChartSampleData(
          x: DateTime(2016, 07, 25),
          open: 98.25,
          high: 104.55,
          low: 96.42,
          close: 104.21),
      ChartSampleData(
          x: DateTime(2016, 08, 01),
          open: 104.41,
          high: 107.65,
          low: 104,
          close: 107.48),
      ChartSampleData(
          x: DateTime(2016, 08, 08),
          open: randomNumber(Random(), 100, 110),
          high: randomNumber(Random(), 100, 110),
          low: randomNumber(Random(), 99, 95),
          close: randomNumber(Random(), 99, 95),),
      ChartSampleData(
          x: DateTime(2016, 08, 15),
          open: 108.14,
          high: 110.23,
          low: 108.08,
          close: 109.36),
      ChartSampleData(
          x: DateTime(2016, 08, 22),
           open: randomNumber(Random(), 100, 110),
          high: randomNumber(Random(), 100, 110),
          low: randomNumber(Random(), 99, 95),
          close: randomNumber(Random(), 99, 95),),
      ChartSampleData(
          x: DateTime(2016, 08, 29),
          open: 106.62,
          high: 108,
          low: 105.5,
          close: 107.73),
      ChartSampleData(
          x: DateTime(2016, 09, 05),
          open: randomNumber(Random(), 100, 110),
          high: randomNumber(Random(), 100, 110),
          low: randomNumber(Random(), 99, 95),
          close: randomNumber(Random(), 99, 95),),
      ChartSampleData(
          x: DateTime(2016, 09, 12),
          open: 102.65,
          high: 116.13,
          low: 102.53,
          close: 114.92),
      ChartSampleData(
          x: DateTime(2016, 09, 19),
           open: randomNumber(Random(), 115, 119),
          high: randomNumber(Random(), 115, 120),
          low: randomNumber(Random(), 110, 114),
          close: randomNumber(Random(), 110, 115),),
      ChartSampleData(
          x: DateTime(2016, 09, 26),
          open: randomNumber(Random(), 115, 119),
          high: randomNumber(Random(), 115, 120),
          low: randomNumber(Random(), 110, 114),
          close: randomNumber(Random(), 110, 115),),
      ChartSampleData(
          x: DateTime(2016, 10, 03),
          open: 112.71,
          high: 114.56,
          low: 112.28,
          close: 114.06),
      ChartSampleData(
          x: DateTime(2016, 10, 10),
          open: randomNumber(Random(), 115, 119),
          high: randomNumber(Random(), 115, 120),
          low: randomNumber(Random(), 110, 114),
          close: randomNumber(Random(), 110, 115),),
      ChartSampleData(
          x: DateTime(2016, 10, 17),
          open: 117.33,
          high: 118.21,
          low: 113.8,
          close: 116.6),
      ChartSampleData(
          x: DateTime(2016, 10, 24),
          open: 117.1,
          high: 118.36,
          low: 113.31,
          close: 113.72),
      ChartSampleData(
          x: DateTime(2016, 10, 31),
          open: 113.65,
          high: 114.23,
          low: 108.11,
          close: 108.84),
      ChartSampleData(
          x: DateTime(2016, 11, 07),
          open: 110.08,
          high: 111.72,
          low: 105.83,
          close: 108.43),
      ChartSampleData(
          x: DateTime(2016, 11, 14),
          open: 107.71,
          high: 110.54,
          low: 104.08,
          close: 110.06),
      ChartSampleData(
          x: DateTime(2016, 11, 21),
          open: 114.12,
          high: 115.42,
          low: 115.42,
          close: 114.12),
      ChartSampleData(
          x: DateTime(2016, 11, 28),
          open: 111.43,
          high: 112.465,
          low: 108.85,
          close: 109.9),
      ChartSampleData(
          x: DateTime(2016, 12, 05),
          open: randomNumber(Random(), 108, 110),
          high: randomNumber(Random(), 113, 115),
          low: randomNumber(Random(), 107, 109),
          close: randomNumber(Random(), 110, 115),),
      ChartSampleData(
          x: DateTime(2016, 12, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 12, 19),
          open: randomNumber(Random(), 108, 110),
          high: randomNumber(Random(), 113, 115),
          low: randomNumber(Random(), 107, 109),
          close: randomNumber(Random(), 110, 115),),
      ChartSampleData(
          x: DateTime(2016, 12, 26),
          open: randomNumber(Random(), 108, 110),
          high: randomNumber(Random(), 113, 115),
          low: randomNumber(Random(), 107, 109),
          close: randomNumber(Random(), 110, 115),),
    ];
    return <HiloOpenCloseSeries<ChartSampleData, DateTime>>[
      HiloOpenCloseSeries<ChartSampleData, DateTime>(
          dataSource: chartData,
          name: 'AAPL',
          showIndicationForSameValues: isCardView != null ? true : _toggleVisibility,
          xValueMapper: (ChartSampleData sales, _) => sales.x,

          /// High, low, open and close values used to render the HLOC series.
          lowValueMapper: (ChartSampleData sales, _) => sales.low,
          highValueMapper: (ChartSampleData sales, _) => sales.high,
          openValueMapper: (ChartSampleData sales, _) => sales.open,
          closeValueMapper: (ChartSampleData sales, _) => sales.close)
    ];
  }

  @override
  void initState() {
    _toggleVisibility = true;
    super.initState();
  }
}
