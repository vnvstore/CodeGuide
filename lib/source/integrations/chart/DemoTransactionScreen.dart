import 'package:fl_chart/fl_chart.dart';      //https://pub.dev/packages/fl_chart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';      //https://pub.dev/packages/nb_utils

class DemoTransactionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoTransactionScreenState();
}

class DemoTransactionScreenState extends State<DemoTransactionScreen> {

  final Color textColorPrimary = Color(0xFF464545);
  final Color textColorSecondary = Color(0xFF747474);
  final Color lineCChart = Color(0xFF23b6e6);
  final Color lineCChart1  = Color(0xFF02d39a);
  final Color borderColor  = Color(0xff37434d);
  final Color borderText  = Color(0xFF7589a2);
  final Color cardColor  =  Color(0xff2c4260);
  final Color cardColor1  =  Color(0xff81e5cd);
  final Color monthChartLeft =  Color(0xff2c274c);
  final Color monthChartRight =  Color(0xff46426c);
  final Color BarChartColor_One = Color(0xff2bdb90);
  final Color BarChartColor_Two = Color(0xffffdd80);
  final Color BarChartColor_Three = Color(0xffff4d94);
  final Color BarChartColor_Four = Color(0xff19bfff);


  final Color leftBarColor = Color(0xff53fdd7);
  final Color rightBarColor = Color(0xffff5182);
  late final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      body: Container(
        height: 300,
        child: BarChart(
          BarChartData(
            maxY: 20,
            barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: grey,
                ),
                touchCallback: (response) {
                  if (response.spot == null) {
                    setState(() {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    });
                    return;
                  }

                  touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                  setState(() {
                    if (response.touchInput is PointerExitEvent || response.touchInput is PointerUpEvent) {
                      touchedGroupIndex = -1;
                      showingBarGroups = List.of(rawBarGroups);
                    } else {
                      showingBarGroups = List.of(rawBarGroups);
                      if (touchedGroupIndex != -1) {
                        double sum = 0.0;
                        for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
                          sum += rod.y;
                        }
                        final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;

                        showingBarGroups[touchedGroupIndex] = showingBarGroups[touchedGroupIndex].copyWith(
                          barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                            return rod.copyWith(y: avg);
                          }).toList(),
                        );
                      }
                    }
                  });
                }),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context) => boldTextStyle(color: borderText),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Mn';
                    case 1:
                      return 'Te';
                    case 2:
                      return 'Wd';
                    case 3:
                      return 'Tu';
                    case 4:
                      return 'Fr';
                    case 5:
                      return 'St';
                    case 6:
                      return 'Sn';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context) => boldTextStyle(color: borderText),
                margin: 32,
                reservedSize: 14,
                getTitles: (value) {
                  if (value == 0) {
                    return '1K';
                  } else if (value == 10) {
                    return '5K';
                  } else if (value == 19) {
                    return '10K';
                  } else {
                    return '';
                  }
                },
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: showingBarGroups,
          ),
        ).center(),
      ).paddingAll(16).center(),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
  }
}
