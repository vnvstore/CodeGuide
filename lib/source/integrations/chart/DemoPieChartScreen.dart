import 'package:flutter/gestures.dart';
import 'package:fl_chart/fl_chart.dart';  //https://pub.dev/packages/fl_chart
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoPieChartScreen extends StatefulWidget {
  static String tag = '/WaveScreen';

  @override
  DemoPieChartScreenState createState() => DemoPieChartScreenState();
}

class DemoPieChartScreenState extends State<DemoPieChartScreen> {
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


  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(40),
              height: 300,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                    setState(() {
                      final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent && pieTouchResponse.touchInput is! PointerUpEvent;
                      if (desiredTouch && pieTouchResponse.touchedSection != null) {
                        touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      } else {
                        touchedIndex = -1;
                      }
                    });
                  }),
                  sections: showingSections(),
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 60,
                  sectionsSpace: 1,
                ),
              ),
            ),
            Column(
              children: [
                dataPieChart(name: 'Tech', color: darkOrchid),
                16.height,
                dataPieChart(name: 'Food', color: mediumSpringGreen),
                16.height,
                dataPieChart(name: 'Rent', color: crimson),
                16.height,
                dataPieChart(name: 'Travel', color: dodgerBlue),
              ],
            ).paddingOnly(left: 32)
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: dodgerBlue,
            value: 30,
            title: 'Travel',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        case 1:
          return PieChartSectionData(
            color: crimson,
            value: 20,
            title: 'Rent',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        case 2:
          return PieChartSectionData(
            color: darkOrchid,
            value: 30,
            title: 'Tech',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        case 3:
          return PieChartSectionData(
            color: mediumSpringGreen,
            value: 20,
            title: 'Food',
            radius: radius,
            titleStyle: boldTextStyle(color: white),
          );
        default:
          throw Error();
      }
    });
  }

  Widget dataPieChart({required Color color, required String name}) {
    return Row(
      children: [
        Container(height: 25, width: 25, color: color),
        16.width,
        Text(name, style: boldTextStyle(color: white)),
      ],
    );
  }
}
