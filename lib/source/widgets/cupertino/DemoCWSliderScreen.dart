import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoCWSliderScreen extends StatefulWidget {
  static String tag = '/DemoCWSliderScreen';

  @override
  DemoCWSliderScreenState createState() => DemoCWSliderScreenState();
}

class DemoCWSliderScreenState extends State<DemoCWSliderScreen> {
  double progressValue = 10.0;
  double divisionsProgressValue = 40.0;

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.height,
            Text(
              "Default Slider",
              style: primaryTextStyle(),
            ).paddingOnly(top: 12, left: 12, right: 12),
            Card(
                color: appStore.appBarColor,
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                elevation: 2.0,
                shadowColor: Colors.black,
                child: ListTile(
                    title: CupertinoSlider(
                      min: 0.0,
                      max: 100.0,
                      value: progressValue,
                      activeColor: appStore.textPrimaryColor,
                      onChanged: (val) {
                        progressValue = val;
                        setState(() {});
                      },
                    ),
                    trailing: Text(
                      "Value =  ${progressValue.toInt()}",
                      style: primaryTextStyle(),
                    ))),
            Text(
              "Discrete Slider",
              style: primaryTextStyle(),
            ).paddingOnly(top: 12, left: 12, right: 12),
            Card(
                color: appStore.appBarColor,
                margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
                elevation: 2.0,
                shadowColor: Colors.black,
                child: ListTile(
                    title: CupertinoSlider(
                      min: 0.0,
                      max: 100.0,
                      divisions: 10,
                      thumbColor: getColorFromHex('#8998FF'),
                      activeColor: appStore.textPrimaryColor,
                      value: divisionsProgressValue,
                      onChanged: (val) {
                        divisionsProgressValue = val;
                        setState(() {});
                      },
                    ),
                    trailing: Text(
                      "Value =  ${divisionsProgressValue.toInt()}",
                      style: primaryTextStyle(),
                    ))),
          ],
        ),
      ),
    );
  }
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
