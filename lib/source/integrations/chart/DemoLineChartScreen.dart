import 'package:fl_chart/fl_chart.dart';  //https://pub.dev/packages/fl_chart
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoLineChartScreen extends StatefulWidget {
  @override
  DemoLineChartScreenState createState() => DemoLineChartScreenState();
}

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

class DemoLineChartScreenState extends State<DemoLineChartScreen> {



  List<Color> gradientColor = [Color(0xFF23b6e6), Color(0xFF02d39a)];

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
        padding: EdgeInsets.only(right: 16),
        height: 350,
        width: 350,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: borderText.withOpacity(0.3),
                    strokeWidth: 1,
                  );
                },
                drawVerticalLine: true),
            borderData: FlBorderData(border: Border.all(color: borderText, width: 1)),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 2.5),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
                  FlSpot(11, 4),
                ],
                isCurved: true,
                colors: gradientColor,
                barWidth: 5,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    colors: gradientColor.map((e) {
                      return e.withOpacity(0.3);
                    }).toList()),
              ),
            ],
          ),
        ),
      ).center(),
    );
  }
}

class LineTitles {

  static getTitleData() => FlTitlesData(
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context) => primaryTextStyle(color: borderText),
            getTitles: (val) {
              switch (val.toInt()) {
                case 2:
                  return '10k';
                case 5:
                  return '30k';
                case 8:
                  return '50k';
              }
              return '';
            },
            reservedSize: 35),
        show: true,
        bottomTitles: SideTitles(
          getTextStyles: (context) => boldTextStyle(color: borderText),
          showTitles: true,
          margin: 8,
          reservedSize: 38,
          getTitles: (val) {
            switch (val.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
        ),
      );
}
