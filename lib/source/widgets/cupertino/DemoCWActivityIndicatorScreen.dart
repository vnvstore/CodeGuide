import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWActivityIndicatorScreen extends StatefulWidget {
  static String tag = '/DemoCWActivityIndicatorScreen';

  @override
  DemoCWActivityIndicatorScreenState createState() => DemoCWActivityIndicatorScreenState();
}

class DemoCWActivityIndicatorScreenState extends State<DemoCWActivityIndicatorScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appStore.iconColor),
        title: Text(
          'Cupertino Activity Indicator',
          style: boldTextStyle(color: appStore.textPrimaryColor),
        ),
      ),
      body: Center(
        child: Theme(
          data: ThemeData.light(),
          child: CupertinoActivityIndicator(
            animating: true,
            radius: 20,
          ),
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