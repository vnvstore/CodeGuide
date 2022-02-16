import 'package:flutter/material.dart';

class DemoMWSliderScreen extends StatefulWidget {
  static String tag = '/DemoMWSliderScreen';

  @override
  DemoMWSliderScreenState createState() => DemoMWSliderScreenState();
}

class DemoMWSliderScreenState extends State<DemoMWSliderScreen> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  
  double _value = 0.33;
  double _value2 = 0.33;
  RangeValues _currentRangeValues = const RangeValues(20, 100);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Defualt Slider',
                style: boldTextStyle,
              ),
            ),

            Theme(
              data: ThemeData.light(),
              child: Slider(
                min: 0,
                max: 100,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Custom Color Slider',
                style: boldTextStyle,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 4.0,
                thumbColor: Colors.redAccent,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              ),
              child: Slider(
                label: 'Hello',
                value: _value2,
                onChanged: (value) {
                  setState(() {
                    _value2 = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 15),
              child: Text(
                'Range Slider',
                style: boldTextStyle,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.orange[700],
                inactiveTrackColor: Colors.orange[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.orangeAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.orange[700],
                inactiveTickMarkColor: Colors.orange[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.orangeAccent,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;

  AppStore(){

    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color(0xFF212121);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color(0xFF212121);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color(0xFF191D36);

  }
}