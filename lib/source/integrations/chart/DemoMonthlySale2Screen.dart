import 'package:fl_chart/fl_chart.dart';  //https://pub.dev/packages/fl_chart
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMonthlySale2Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoMonthlySale2ScreenState();
}

class DemoMonthlySale2ScreenState extends State<DemoMonthlySale2Screen> {
  final Color textColorPrimary = Color(0xFF464545);
  final Color textColorSecondary = Color(0xFF747474);
  final Color lineCChart = Color(0xFF23b6e6);
  final Color lineCChart1  = Color(0xFF02d39a);
  final Color borderColor  = Color(0xff37434d);
  final Color borderText  = Color(0xFF7589a2);
  final Color cardColor  =  Color(0xff2c4260);
  final Color TransactionLeft =  Color(0xff53fdd7);
  final Color TransactionRight =  Color(0xffff5182);
  final Color cardColor1  =  Color(0xff81e5cd);
  final Color monthChartLeft =  Color(0xff2c274c);
  final Color monthChartRight =  Color(0xff46426c);
  final Color BarChartColor_One = Color(0xff2bdb90);
  final Color BarChartColor_Two = Color(0xffffdd80);
  final Color BarChartColor_Three = Color(0xffff4d94);
  final Color BarChartColor_Four = Color(0xff19bfff);


  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      body: Container(
        height: 300,
        width: context.width() * 0.8,
        child: LineChart(
          sampleData1(),
          duration: Duration(milliseconds: 250),
        ),
      ).center(),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withValues(alpha: 0.8),
        ),
        touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              String text = '';
              switch (value.toInt()) {
                case 2:
                  text = 'SEPT';
                  break;
                case 7:
                  text = 'OCT';
                  break;
                case 12:
                  text = 'DEC';
                  break;
              }
              return SideTitleWidget(
                meta: meta,
                space: 10,
                child: Text(text, style: boldTextStyle(color: TransactionRight)),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              String text = '';
              switch (value.toInt()) {
                case 1:
                  text = '1m';
                  break;
                case 2:
                  text = '2m';
                  break;
                case 3:
                  text = '3m';
                  break;
                case 4:
                  text = '5m';
                  break;
              }
              return SideTitleWidget(
                meta: meta,
                space: 10,
                child: Text(text, style: boldTextStyle(color: TransactionRight)),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: monthChartRight,
            width: 4,
          ),
          left: BorderSide(
            width: 4,
            color: monthChartRight,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      color: aquamarine,
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      color: darkOrchid,
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );
    final lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      color: deepSkyBlue,
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}
