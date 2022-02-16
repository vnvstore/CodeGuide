import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/flutter_fluid_slider.dart';

class DemoFluidSliderScreen extends StatefulWidget {
  static String tag = '/DemoFluidSliderScreen';

  @override
  DemoFluidSliderScreenState createState() => DemoFluidSliderScreenState();
}

class DemoFluidSliderScreenState extends State<DemoFluidSliderScreen> {
  double value = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FluidSlider(
            start: Text('0',style: primaryTextStyle(color: white)),
            end: Text('100',style: primaryTextStyle(color: white)),
            value: value,
            labelsTextStyle: primaryTextStyle(),
            valueTextStyle: primaryTextStyle(color: textPrimaryColor),
            onChanged: (double newValue) {
              setState(() {
                value = newValue;
              });
            },
            min: 0.0,
            max: 100.0,
          ),
        ],
      ).paddingAll(8),
    );
  }
}
