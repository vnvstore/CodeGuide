import 'package:flutter/material.dart';
import '../../Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';    //https://pub.dev/packages/nb_utils

class DemoMWTooltipScreen extends StatefulWidget {
  static String tag = '/DemoMWTooltipScreen';

  @override
  DemoMWTooltipScreenState createState() => DemoMWTooltipScreenState();
}

class DemoMWTooltipScreenState extends State<DemoMWTooltipScreen> {
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "Long Press the icon",
                style: primaryTextStyle(color: appStore.textPrimaryColor),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Tooltip(
                      message: 'Search',
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: 35,
                          color: appStore.iconColor,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Tooltip(
                    child: IconButton(
                      icon: Icon(Icons.info, size: 35.0, color: appStore.iconColor),
                      onPressed: () {},
                    ),
                    message: lipsum.createParagraph(numSentences: 1),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(20),
                    showDuration: Duration(seconds: 10),
                    decoration: BoxDecoration(
                      color: appStore.appColorPrimary,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    textStyle: TextStyle(color: Colors.white),
                    preferBelow: true,
                    verticalOffset: 20,
                  ),
                )
              ],
            ),
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