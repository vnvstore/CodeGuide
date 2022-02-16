import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWSegmentedControlScreen extends StatefulWidget {
  static String tag = '/DemoCWSegmentedControlScreen';

  @override
  DemoCWSegmentedControlScreenState createState() => DemoCWSegmentedControlScreenState();
}

class DemoCWSegmentedControlScreenState extends State<DemoCWSegmentedControlScreen> {
  int selectedValue = 0;

  final Map<int, Widget> sWidget = <int, Widget>{0: Text("Home", style: primaryTextStyle()), 1: Text("Search", style: primaryTextStyle()), 2: Text("Profile", style: primaryTextStyle())};

  static Widget giveCenter(String yourText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        12.height,
        Text("$yourText", style: boldTextStyle()).paddingOnly(left: 16, right: 16),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Text(
            lipsum.createParagraph(numSentences: 2),
            style: secondaryTextStyle(),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  List<Widget> view = [giveCenter("Home Page"), giveCenter("Search Page"), giveCenter("Profile Page")];

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
    final Map<int, Widget> sWidget = <int, Widget>{
      0: Text("Home", style: primaryTextStyle(color: selectedValue == 0 ? white : appStore.textPrimaryColor)),
      1: Text("Search", style: primaryTextStyle(color: selectedValue == 1 ? white : appStore.textPrimaryColor)),
      2: Text("Profile", style: primaryTextStyle(color: selectedValue == 2 ? white : appStore.textPrimaryColor))
    };

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              16.height,
              Container(
                color: appStore.appBarColor,
                width: context.width(),
                child: CupertinoSegmentedControl(
                  borderColor: appStore.appColorPrimary,
                  selectedColor: appStore.appColorPrimary,
                  groupValue: selectedValue,
                  onValueChanged: (dynamic val) {
                    setState(() {
                      selectedValue = val;
                    });
                  },
                  children: sWidget,
                ),
              ),
              8.height,
              view[selectedValue]
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