/// Package imports
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model/sample_view.dart';

/// Local imports


///Renders line series with point color mapping
class LineMultiColor extends SampleView {
  ///Renders line series with point color mapping
  const LineMultiColor(Key key) : super(key: key);

  @override
  _LineMultiColorState createState() => _LineMultiColorState();
}

class _LineMultiColorState extends SampleViewState {
  _LineMultiColorState();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        image: DecorationImage(
          image: AssetImage("assets/emprec.jpg"),
              fit: BoxFit.cover
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(180.0),
        child: Card(
          // color: Colors.white.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getMultiColorLineChart(),
            )),
      ),
    );
  }

  ///Get the chart with multi colored line series
  SfCartesianChart _getMultiColorLineChart() {
    return SfCartesianChart(
      title: ChartTitle(text: false ? '' : 'Normal Level'),
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
          intervalType: DateTimeIntervalType.years,
          dateFormat: DateFormat.y(),
          majorGridLines: MajorGridLines(width: 0),
          title: AxisTitle(text: false ? '' : 'Total Number of Employee')),
      // primaryYAxis: NumericAxis(
      //     minimum: 200,
      //     maximum: 600,
      //     interval: 100,
      //     axisLine: AxisLine(width: 0),
      //     labelFormat: '{value}mm',
      //     majorTickLines: MajorTickLines(size: 0)),
      series: _getMultiColoredLineSeries(),
      trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          lineType: TrackballLineType.vertical,
          tooltipSettings: InteractiveTooltip(format: 'point.x : point.y')),
    );
  }

  ///Get multi colored line series
  List<LineSeries<_ChartData, DateTime>> _getMultiColoredLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[
      _ChartData(DateTime(1),1, const Color.fromRGBO(248, 184, 131, 1)),
      _ChartData( DateTime(2),2, const Color.fromRGBO(229, 101, 144, 1)),
      _ChartData( DateTime(3),3, const Color.fromRGBO(53, 124, 210, 1)),
      _ChartData( DateTime(4),4, const Color.fromRGBO(0, 189, 174, 1)),
      _ChartData( DateTime(5),5, const Color.fromRGBO(248, 184, 131, 1)),

    ];
    return <LineSeries<_ChartData, DateTime>>[
      LineSeries<_ChartData, DateTime>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,

          /// The property used to apply the color each data.
          pointColorMapper: (_ChartData sales, _) => sales.lineColor,
          width: 2)
    ];
  }
}

class _ChartData {
  _ChartData(
      this.x,
      this.y, [this.lineColor]);
  final DateTime x;
  final double y;
  final Color lineColor;
}
