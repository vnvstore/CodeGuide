import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'DemoButtonTempratureWidget.dart';
import 'DemoSemiCircleWidget.dart';
import 'DemoTemperatureWidget.dart';
import 'modal/view_modal.dart';
import 'package:provider/provider.dart';

class DemoTemperatureWidgetScreen extends StatefulWidget {
  @override
  DemoTemperatureWidgetScreenState createState() => DemoTemperatureWidgetScreenState();
}

class DemoTemperatureWidgetScreenState extends State<DemoTemperatureWidgetScreen> {
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
    return ChangeNotifierProvider<ViewModel>(
      create: (context) => ViewModel(),
      child: Consumer<ViewModel>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: appBarWidget('Temperature', color: getBackGroundColor(provider.myList[1].value), elevation: 0),
            body: AnimatedContainer(
              height: context.height(),
              width: context.width(),
              duration: 500.milliseconds,
              color: getBackGroundColor(provider.myList[1].value),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DemoButtonTemperatureType(iconData: Icons.watch_later_outlined, status: false),
                      8.width,
                      DemoButtonTemperatureType(iconData: Icons.ac_unit, status: true),
                      8.width,
                      DemoButtonTemperatureType(iconData: Icons.wb_sunny, status: false),
                      8.width,
                      DemoButtonTemperatureType(iconData: Icons.tv_outlined, status: false),
                    ],
                  ).paddingSymmetric(horizontal: 8),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedContainer(
                        duration: 500.milliseconds,
                        width: 260,
                        height: 260,
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
                      ),
                      DemoSemiCircleWidget(
                        diameter: 200,
                        sweepAngle: ((provider.myList[1].value - 15) * 12.0).clamp(0.0, 180.0),
                        color: getSliderColor(provider.myList[1].value),
                      ),
                      AnimatedContainer(
                        duration: 500.milliseconds,
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(color: context.cardColor, shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                      ),
                      Text(
                        '${convertToInt(provider.myList[1].value)}°C',
                        style: boldTextStyle(size: 60, weight: FontWeight.w600),
                      ),
                    ],
                  ),
                  DemoTemperatureWidget(
                    temperature: provider.myList[1],
                    onChanged: (value) {
                      provider.changeValue(value);
                    },
                  ).paddingBottom(16.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

int convertToInt(double value) {
  return value.toInt();
}

Color? getSliderColor(double value) {
  int newValue = value.toInt();
  Color? newColor;
  if (newValue >= 16 && newValue < 19) {
    newColor = Colors.green;
  } else if (newValue >= 19 && newValue < 22) {
    newColor = Colors.teal;
  } else if (newValue >= 22 && newValue < 25) {
    newColor = Colors.blue;
  } else if (newValue >= 25 && newValue < 28) {
    newColor = Colors.purple;
  } else if (newValue >= 28) {
    newColor = Colors.red;
  }

  return newColor;
}

Color? getBackGroundColor(double value) {
  int newValue = value.toInt();
  Color? newColor;
  if (newValue >= 16 && newValue < 19) {
    newColor = Colors.green.withOpacity(0.2);
  } else if (newValue >= 19 && newValue < 22) {
    newColor = Colors.teal.withOpacity(0.2);
  } else if (newValue >= 22 && newValue < 25) {
    newColor = Colors.blue.withOpacity(0.2);
  } else if (newValue >= 25 && newValue < 28) {
    newColor = Colors.purple.withOpacity(0.2);
  } else if (newValue >= 28) {
    newColor = Colors.red.withOpacity(0.2);
  }

  return newColor;
}
