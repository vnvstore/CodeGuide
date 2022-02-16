import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart'; //https://pub.dev/packages/nb_utils

class DemoCWTextFieldScreen extends StatefulWidget {
  static String tag = '/DemoCWTextFieldScreen';

  @override
  DemoCWTextFieldScreenState createState() => DemoCWTextFieldScreenState();
}

class DemoCWTextFieldScreenState extends State<DemoCWTextFieldScreen> {
  bool isVisible = true;

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
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Default TextField', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              decoration: BoxDecoration(
                  color: appStore.appBarColor,
                  border: Border.all(
                      width: 1, color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              style: primaryTextStyle(),
              cursorColor: blackColor,
              padding: EdgeInsets.only(left: 8, right: 4, top: 12, bottom: 12),
            ),
            12.height,
            Text('TextField with PlaceHolder', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              decoration: BoxDecoration(
                  color: appStore.appBarColor,
                  border: Border.all(
                      width: 1, color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              placeholder: 'Please enter text here',
              style: primaryTextStyle(),
              cursorColor: blackColor,
              placeholderStyle: secondaryTextStyle(color: grey, size: 18),
              padding: EdgeInsets.all(12),
            ),
            12.height,
            Text('TextField with Prefix Widget', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              decoration: BoxDecoration(
                  color: appStore.appBarColor,
                  border: Border.all(
                      width: 1, color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              placeholder: 'Please enter email here',
              placeholderStyle: secondaryTextStyle(color: grey, size: 18),
              cursorColor: blackColor,
              prefix: Icon(Icons.email, color: appStore.iconColor)
                  .paddingOnly(left: 4, right: 4),
              padding: EdgeInsets.all(12),
              style: primaryTextStyle(),
            ),
            12.height,
            Text('TextField with Suffix Widget', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              decoration: BoxDecoration(
                  color: appStore.appBarColor,
                  border: Border.all(
                      width: 1, color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              placeholder: 'Please enter password here',
              placeholderStyle: secondaryTextStyle(color: grey, size: 18),
              cursorColor: blackColor,
              autocorrect: true,
              obscureText: isVisible,
              style: primaryTextStyle(),
              suffix: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: appStore.iconColor,
              ).paddingOnly(left: 4, right: 8).onTap(() {
                isVisible = !isVisible;
                setState(() {});
              }),
              padding: EdgeInsets.all(12),
            ),
            12.height,
            Text('TextField with Background color', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              placeholder: 'Please enter text here',
              placeholderStyle:
                  secondaryTextStyle(color: white.withOpacity(0.7), size: 18),
              style: primaryTextStyle(),
              cursorColor: white,
              decoration: BoxDecoration(
                color: getColorFromHex('#8998FF'),
              ),
              padding: EdgeInsets.all(12),
            ),
            12.height,
            Text('TextField with Border', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              placeholder: 'Please enter text here',
              placeholderStyle:
                  TextStyle(color: appStore.textPrimaryColor.withOpacity(0.5)),
              style: primaryTextStyle(),
              cursorColor: blackColor,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: appStore.textPrimaryColor.withOpacity(0.7)),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: EdgeInsets.all(12),
            ),
            12.height,
            Text('TextField with circular Border', style: boldTextStyle()),
            12.height,
            CupertinoTextField(
              placeholder: 'Please enter text here',
              placeholderStyle:
                  TextStyle(color: appStore.textPrimaryColor.withOpacity(0.5)),
              style: primaryTextStyle(),
              cursorColor: blackColor,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: appStore.textPrimaryColor.withOpacity(0.7)),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              padding: EdgeInsets.all(12),
            ),
            12.height
          ],
        ).paddingOnly(left: 12, right: 12, top: 12),
      )),
    );
  }
}

AppStore appStore = AppStore();

class AppStore {
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
