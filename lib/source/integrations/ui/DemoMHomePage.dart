import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/MarqueeUtil.dart' as m;

class DemoMHomePage extends StatefulWidget {
  static String tag = '/DemoMHomePage';

  @override
  _DemoMHomePageState createState() => _DemoMHomePageState();
}

class _DemoMHomePageState extends State<DemoMHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    ' Simple Marquee',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8998FF),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 5),
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                  child: m.Marquee(
                    text: 'A life without suffering is a life without happiness.',
                    style: TextStyle(fontSize: 15, color: appStore.textPrimaryColor),
                    startPadding: 10.0,
                    blankSpace: 20.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Different TextStyle Marquee',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8998FF),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 15),
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                  child: m.Marquee(
                    text: 'A life without suffering is a life without happiness.',
                    //  Style the text within the Marquee.
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                    //  Control the scroll of marquee to vertical or horizontal.
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 20.0,
                    //  Control the speed of the marquee.
                    velocity: 100.0,
                    //  Duration you want to set after one round of marque is over.
                    pauseAfterRound: Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 2),
                    accelerationCurve: Curves.elasticIn,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeInCubic,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    height: 40,
                    decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                    child: m.Marquee(
                      text: 'A life without suffering is a life without happiness.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: appStore.textPrimaryColor),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 2),
                      accelerationCurve: Curves.elasticIn,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeInCubic,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 15),
                  child: Text(
                    'Different Speed Marquee',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8998FF),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                  child: m.Marquee(
                    text: 'A life without suffering is a life without happiness.',
                    style: TextStyle(fontWeight: FontWeight.bold, color: appStore.textPrimaryColor),
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    blankSpace: 20.0,
                    velocity: 40.0,
                    pauseAfterRound: Duration(seconds: 1),
                    startPadding: 10.0,
                    accelerationDuration: Duration(seconds: 2),
                    accelerationCurve: Curves.elasticIn,
                    decelerationDuration: Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeInCubic,
                  ),
                ),
                Container(
                    height: 40,
                    decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                    margin: EdgeInsets.only(top: 8),
                    child: m.Marquee(
                      text: 'A life without suffering is a life without happiness.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: appStore.textSecondaryColor),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 20.0,
                      velocity: 60.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 2),
                      accelerationCurve: Curves.elasticIn,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeInCubic,
                    )),
                Container(
                    height: 40,
                    decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                    margin: EdgeInsets.only(top: 8),
                    child: m.Marquee(
                      text: 'A life without suffering is a life without happiness.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: appStore.textPrimaryColor),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 20.0,
                      velocity: 80.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 2),
                      accelerationCurve: Curves.elasticIn,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeInCubic,
                    )),
                Container(
                    height: 40,
                    decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                    margin: EdgeInsets.only(top: 8),
                    child: m.Marquee(
                      text: 'A life without suffering is a life without happiness.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: appStore.textPrimaryColor),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 2),
                      accelerationCurve: Curves.elasticIn,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeInCubic,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Vertical Marquee',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8998FF),
                    ),
                  ),
                ),
                Container(
                    height: 150,
                    margin: EdgeInsets.only(top: 15),
                    decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor),
                    child: m.Marquee(
                      text: 'A life without suffering is a life without happiness. Stay Happy :)',
                      style: TextStyle(fontWeight: FontWeight.bold, color: appStore.textPrimaryColor),
                      scrollAxis: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      blankSpace: 20.0,
                      velocity: 100.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 2),
                      accelerationCurve: Curves.elasticIn,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeInCubic,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const ShadowColor = Color(0x95E9EBF0);

BoxDecoration boxDecorations({double radius = 8, Color color = Colors.transparent, Color bgColor = Colors.white, var showShadow = true}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow ? [BoxShadow(color: ShadowColor, blurRadius: 10, spreadRadius: 2)] : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}