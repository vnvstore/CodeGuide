import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWDividerScreen extends StatefulWidget {
  static String tag = '/DemoMWDividerScreen';

  @override
  DemoMWDividerScreenState createState() => DemoMWDividerScreenState();
}

class DemoMWDividerScreenState extends State<DemoMWDividerScreen> {
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Horizontal Divider",
                style: boldTextStyle(),
              ).paddingOnly(top: 16, bottom: 16),
              Divider(
                color: appStore.iconColor,
                thickness: 2,
              ),
              16.height,
              Divider(
                color: Colors.deepOrangeAccent,
                thickness: 6,
              ),
              16.height,
              Row(children: <Widget>[
                Expanded(child: Divider(color: appStore.iconColor)),
                16.width,
                Text(
                  "OR",
                  style: boldTextStyle(),
                ),
                16.width,
                Expanded(child: Divider(color: appStore.iconColor)),
              ]),
              Text(
                "Dashed Divider",
                style: boldTextStyle(),
              ).paddingOnly(top: 30, bottom: 16),
              Separator(
                color: appStore.appColorPrimary,
                dashWidth: 20,
                height: 4,
              ),
              20.height,
              Separator(color: Colors.grey),
              Text(
                "Vertical Divider",
                style: boldTextStyle(),
              ).paddingOnly(top: 30, bottom: 16),
              IntrinsicHeight(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Account',
                    style: boldTextStyle(),
                  ),
                  VerticalDivider(
                    color: appStore.iconColor,
                    thickness: 2,
                  ),
                  Text(
                    'Setting',
                    style: boldTextStyle(),
                  ),
                  VerticalDivider(
                    color: appStore.iconColor,
                    thickness: 2,
                  ),
                  Text(
                    'Profile',
                    style: boldTextStyle(),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  final double height;
  final double dashWidth;
  final Color color;

  const Separator({this.height = 1, this.dashWidth = 10, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidths = dashWidth;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidths)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidths,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
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