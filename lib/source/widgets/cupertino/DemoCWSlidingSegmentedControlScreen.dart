import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import '../../Lipsum.dart' as lipsum;


class DemoCWSlidingSegmentedControlScreen extends StatefulWidget {
  static String tag = '/DemoCWSlidingSegmentedControlScreen';

  @override
  DemoCWSlidingSegmentedControlScreenState createState() => DemoCWSlidingSegmentedControlScreenState();
}

class DemoCWSlidingSegmentedControlScreenState extends State<DemoCWSlidingSegmentedControlScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = <int, Widget>{0: Text("Item 1"), 1: Text("Item 2")};
  int? _sliding = 0;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget mPage(var value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: boldTextStyle(),
          ).paddingLeft(16),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            child: Text(
              lipsum.createParagraph(numSentences: 2),
              style: secondaryTextStyle(),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Home',
                          style: primaryTextStyle(color: _sliding == 0 ? blackColor : grey),
                        )),
                    1: Container(padding: EdgeInsets.all(8), child: Text('Booking', style: primaryTextStyle(color: _sliding == 1 ? blackColor : grey))),
                    2: Container(padding: EdgeInsets.all(8), child: Text('Setting', style: primaryTextStyle(color: _sliding == 2 ? blackColor : grey))),
                  },
                  groupValue: _sliding,
                  onValueChanged: (dynamic newValue) {
                    setState(() {
                      _sliding = newValue;
                    });
                  }),
            ),
            if (_sliding == 0) mPage("Home"),
            if (_sliding == 1) mPage("Booking"),
            if (_sliding == 2) mPage("Setting"),
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