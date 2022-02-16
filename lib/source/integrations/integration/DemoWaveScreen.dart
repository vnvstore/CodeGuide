import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/wave/config.dart';
import 'utils/wave/wave.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoWaveScreen extends StatefulWidget {
  static String tag = '/DemoWaveScreen';

  @override
  DemoWaveScreenState createState() => DemoWaveScreenState();
}

class DemoWaveScreenState extends State<DemoWaveScreen> {
  Color appColorPrimary = Color(0xFF1157FA);

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    return Scaffold(
      body: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Color(0xFF676B76), Color(0xEE676B76)],
            [Color(0xFFECB099), Color(0xEEECB099)],
            [Color(0xFFdea34b), Color(0xEEdea34b)],
            [Color(0xFFA3CEB6), Color(0xEEA3CEB6)],
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.30],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 0,
        backgroundColor: Colors.white,
        size: Size(double.infinity, double.infinity),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }
}
