import 'dart:math';

import 'package:fl_chart/fl_chart.dart';  //https://pub.dev/packages/fl_chart
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

// ignore: must_be_immutable
class DemoBarChart1Screen extends StatefulWidget {
  List<Color> availableColors = [
    purple,
    yellow,
    mediumSlateBlue,
    orange,
    orchid,
    violet,
  ];
  @override
  State<StatefulWidget> createState() => DemoBarChart1ScreenState();
}

class DemoBarChart1ScreenState extends State<DemoBarChart1Screen> {
  final Color barBackgroundColor = Color(0xFF02d39a);
  final Color lineCChart = Color(0xFF23b6e6);
  final Color cardColor = Colors.white;
  final Color  transactionRight =  Color(0xffff5182);

  final Duration animDuration = Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: context.height() * 0.5,
                width: 300,
                child: BarChart(
                  isPlaying ? randomData() : mainBarData(),
                  duration: animDuration,
                ),
              ),
              12.height,
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: lineCChart,
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        refreshState();
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = redColor,
    double width = 22,
    List<int>? showTooltips,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? yellow : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(
      7,
      (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      },
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => grey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                boldTextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: TextStyle(
                      color: yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (barTouchResponse != null && barTouchResponse.spot != null && event is! FlTapUpEvent && event is! FlPanEndEvent) {
              touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            getTitlesWidget: (double value, TitleMeta meta) {
              String text;
              switch (value.toInt()) {
                case 0:
                  text = 'M';
                  break;
                case 1:
                  text = 'T';
                  break;
                case 2:
                  text = 'W';
                  break;
                case 3:
                  text = 'T';
                  break;
                case 4:
                  text = 'F';
                  break;
                case 5:
                  text = 'S';
                  break;
                case 6:
                  text = 'S';
                  break;
                default:
                  text = '';
                  break;
              }
              return SideTitleWidget(
                meta: meta,
                space: 16,
                child: Text(text, style: boldTextStyle(color: transactionRight)),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            getTitlesWidget: (double value, TitleMeta meta) {
              String text;
              switch (value.toInt()) {
                case 0:
                  text = 'M';
                  break;
                case 1:
                  text = 'T';
                  break;
                case 2:
                  text = 'W';
                  break;
                case 3:
                  text = 'T';
                  break;
                case 4:
                  text = 'F';
                  break;
                case 5:
                  text = 'S';
                  break;
                case 6:
                  text = 'S';
                  break;
                default:
                  text = '';
                  break;
              }
              return SideTitleWidget(
                meta: meta,
                space: 16,
                child: Text(text, style: boldTextStyle(color: transactionRight)),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6, barColor: widget.availableColors[Random().nextInt(widget.availableColors.length)]);
          default:
            return throw Error();
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(animDuration + Duration(milliseconds: 50));
    if (isPlaying) {
      await refreshState();
    }
  }
}


