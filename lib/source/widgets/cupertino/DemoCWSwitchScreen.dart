import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWSwitchScreen extends StatefulWidget {
  static String tag = '/DemoCWSwitchScreen';

  @override
  DemoCWSwitchScreenState createState() => DemoCWSwitchScreenState();
}

class DemoCWSwitchScreenState extends State<DemoCWSwitchScreen> {
  bool isDefault = true;
  bool isTrackColorSwitch = false;
  bool isActiveColorSwitch = true;
  bool isDragColorSwitch = false;

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
      body: SafeArea(
          child: Column(
        children: [
          Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              elevation: 2.0,
              shadowColor: Colors.black,
              child: ListTile(
                  title: Text(
                    'Default Switch',
                    style: primaryTextStyle(),
                  ),
                  trailing: CupertinoSwitch(
                    value: isDefault,
                    onChanged: (bool val) {
                      isDefault = val;
                      setState(() {});
                    },
                  ))),
          Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              elevation: 2.0,
              shadowColor: Colors.black,
              child: ListTile(
                  title: Text(
                    'Switch with track & active color',
                    style: primaryTextStyle(),
                  ),
                  trailing: CupertinoSwitch(
                    value: isTrackColorSwitch,
                    trackColor: getColorFromHex('#8998FF'),
                    activeColor: getColorFromHex('#f2866c'),
                    onChanged: (bool val) {
                      isTrackColorSwitch = val;
                      setState(() {});
                    },
                  ))),
          Card(
              color: appStore.appBarColor,
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              elevation: 2.0,
              shadowColor: Colors.black,
              child: ListTile(
                  title: Text(
                    'Switch with active color',
                    style: primaryTextStyle(),
                  ),
                  trailing: CupertinoSwitch(
                    value: isActiveColorSwitch,
                    activeColor: getColorFromHex('#f2866c'),
                    onChanged: (bool val) {
                      isActiveColorSwitch = val;
                      setState(() {});
                    },
                  ))),
        ],
      )),
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