import 'dart:core';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';                //https://pub.dev/packages/nb_utils
import 'package:syncfusion_flutter_charts/charts.dart'; //https://pub.dev/packages/syncfusion_flutter_charts

class DemoStackedChart1Screen extends StatefulWidget {
  @override
  DemoStackedChart1ScreenState createState() => DemoStackedChart1ScreenState();
}

class DemoStackedChart1ScreenState extends State<DemoStackedChart1Screen> {
  late List<ExpenseData> chartData;
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    chartData = getChartData();
    tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        width: context.width(),
        child: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(enablePinching: true, enablePanning: true),
          tooltipBehavior: tooltipBehavior,
          series: <ChartSeries>[
            StackedLineSeries<ExpenseData, String>(
              name: 'Father',
              markerSettings: MarkerSettings(isVisible: true),
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expanseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.father,
            ),
            StackedLineSeries<ExpenseData, String>(
              name: 'Mother',
              markerSettings: MarkerSettings(isVisible: true),
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expanseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.mother,
            ),
            StackedLineSeries<ExpenseData, String>(
              name: 'Son',
              markerSettings: MarkerSettings(isVisible: true),
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expanseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.son,
            ),
            StackedLineSeries<ExpenseData, String>(
              name: 'Daughter',
              markerSettings: MarkerSettings(isVisible: true),
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expanseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.daughter,
            ),
          ],
          primaryXAxis: CategoryAxis(),
        ),
      ).center(),
    );
  }

  List<ExpenseData> getChartData() {
    List<ExpenseData> list = [];
    list.add(ExpenseData(expanseCategory: 'Food', father: 55, mother: 48, daughter: 45, son: 10));
    list.add(ExpenseData(expanseCategory: 'Transport', father: 33, mother: 45, daughter: 54, son: 28));
    list.add(ExpenseData(expanseCategory: 'Medical', father: 40, mother: 23, daughter: 20, son: 34));
    list.add(ExpenseData(expanseCategory: 'Clothes', father: 75, mother: 54, daughter: 23, son: 54));
    list.add(ExpenseData(expanseCategory: 'Books', father: 12, mother: 18, daughter: 43, son: 55));
    list.add(ExpenseData(expanseCategory: 'Other', father: 23, mother: 54, daughter: 33, son: 23));

    return list;
  }


}

class ExpenseData {
  String? expanseCategory;
  num? father;
  num? mother;
  num? son;
  num? daughter;

  ExpenseData({this.expanseCategory, this.father, this.mother, this.son, this.daughter});
}