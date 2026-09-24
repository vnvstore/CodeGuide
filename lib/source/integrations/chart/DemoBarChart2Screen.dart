import 'package:fl_chart/fl_chart.dart';  //https://pub.dev/packages/fl_chart
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoBarChart2Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoBarChart2ScreenState();
}

class DemoBarChart2ScreenState extends State<DemoBarChart2Screen> {
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

  static double barWidth = 22;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff020227),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        height: 450,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 20,
            minY: -20,
            groupsSpace: 12,
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 24,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = 'Mon';
                        break;
                      case 1:
                        text = 'Tue';
                        break;
                      case 2:
                        text = 'Wed';
                        break;
                      case 3:
                        text = 'Thu';
                        break;
                      case 4:
                        text = 'Fri';
                        break;
                      case 5:
                        text = 'Sat';
                        break;
                      case 6:
                        text = 'Sun';
                        break;
                      default:
                        text = '';
                        break;
                    }
                    return SideTitleWidget(
                      meta: meta,
                      space: 10,
                      child: Text(text, style: boldTextStyle(size: 10, color: white)),
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 24,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = 'Mon';
                        break;
                      case 1:
                        text = 'Tue';
                        break;
                      case 2:
                        text = 'Wed';
                        break;
                      case 3:
                        text = 'Thu';
                        break;
                      case 4:
                        text = 'Fri';
                        break;
                      case 5:
                        text = 'Sat';
                        break;
                      case 6:
                        text = 'Sun';
                        break;
                      default:
                        text = '';
                        break;
                    }
                    return SideTitleWidget(
                      meta: meta,
                      space: 10,
                      child: Text(text, style: boldTextStyle(color: white, size: 10)),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5,
                  reservedSize: 30,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    String text = value == 0 ? '0' : '${value.toInt()}0k';
                    return SideTitleWidget(
                      meta: meta,
                      space: 8,
                      child: Transform.rotate(
                        angle: 45 * 3.141592653589793 / 180,
                        child: Text(text, style: boldTextStyle(color: white, size: 10)),
                      ),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5,
                  reservedSize: 30,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    String text = value == 0 ? '0' : '${value.toInt()}0k';
                    return SideTitleWidget(
                      meta: meta,
                      space: 8,
                      child: Transform.rotate(
                        angle: 90 * 3.141592653589793 / 180,
                        child: Text(text, style: boldTextStyle(color: white, size: 10)),
                      ),
                    );
                  },
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (value) => value % 5 == 0,
              getDrawingHorizontalLine: (value) {
                if (value == 0) {
                  return FlLine(color: monthChartRight, strokeWidth: 3);
                }
                return FlLine(
                  color: monthChartLeft,
                  strokeWidth: 0.8,
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    toY: 15.1,
                    width: barWidth,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 2, BarChartColor_One),
                      BarChartRodStackItem(2, 5, BarChartColor_Two),
                      BarChartRodStackItem(5, 7.5, BarChartColor_Three),
                      BarChartRodStackItem(7.5, 15.5, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: -14,
                    width: barWidth,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -1.8, BarChartColor_One),
                      BarChartRodStackItem(-1.8, -4.5, BarChartColor_Two),
                      BarChartRodStackItem(-4.5, -7.5, BarChartColor_Three),
                      BarChartRodStackItem(-7.5, -14, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    toY: 13,
                    width: barWidth,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 1.5, BarChartColor_One),
                      BarChartRodStackItem(1.5, 3.5, BarChartColor_Two),
                      BarChartRodStackItem(3.5, 7, BarChartColor_Three),
                      BarChartRodStackItem(7, 13, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: 13.5,
                    width: barWidth,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 1.5, BarChartColor_One),
                      BarChartRodStackItem(1.5, 3, BarChartColor_Two),
                      BarChartRodStackItem(3, 7, BarChartColor_Three),
                      BarChartRodStackItem(7, 13.5, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    toY: -18,
                    width: barWidth,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -2, BarChartColor_One),
                      BarChartRodStackItem(-2, -4, BarChartColor_Two),
                      BarChartRodStackItem(-4, -9, BarChartColor_Three),
                      BarChartRodStackItem(-9, -18, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    toY: -17,
                    width: barWidth,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, -1.2, BarChartColor_One),
                      BarChartRodStackItem(-1.2, -2.7, BarChartColor_Two),
                      BarChartRodStackItem(-2.7, -7, BarChartColor_Three),
                      BarChartRodStackItem(-7, -17, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    toY: 16,
                    width: barWidth,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    rodStackItems: [
                      BarChartRodStackItem(0, 1.2, BarChartColor_One),
                      BarChartRodStackItem(1.2, 6, BarChartColor_Two),
                      BarChartRodStackItem(6, 11, BarChartColor_Three),
                      BarChartRodStackItem(11, 17, BarChartColor_Four),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
