import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWButtonScreen extends StatefulWidget {
  static String tag = '/DemoCWButtonScreen';

  @override
  DemoCWButtonScreenState createState() => DemoCWButtonScreenState();
}

class DemoCWButtonScreenState extends State<DemoCWButtonScreen> {
  Color one = getColorFromHex('#DB7093');

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
          children: [
            16.height,
            Container(
              width: context.width(),
              child: CupertinoButton(
                child: Text('Default Button', style: primaryTextStyle(color: appStore.textPrimaryColor, size: 18)),
                onPressed: () {
                  toasty(context, 'Default Button');
                },
              ).paddingAll(8.0),
            ),
            Container(
              width: context.width(),
              decoration: BoxDecoration(border: Border.all(color: appStore.appColorPrimary, width: 1.5), borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: CupertinoButton(
                child: Text('Button with Border', style: primaryTextStyle(color: getColorFromHex('#8998FF'), size: 18)),
                onPressed: () {
                  toasty(context, 'Button with Border');
                },
              ),
            ).paddingAll(8.0),
            Container(
              width: context.width(),
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton(
                child: Text('Button with Color', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Button with Color');
                },
                color: getColorFromHex('#8998FF'),
              ),
            ),
            Container(
              width: context.width(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [getColorFromHex('#8998FF'), getColorFromHex('#75D7D3')],
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: CupertinoButton(
                child: Text('Button with Gradient', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Button with Gradient');
                },
              ),
            ).paddingAll(8.0),
            Container(
              width: context.width(),
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Text('Circular Button', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Circular Button');
                },
                color: getColorFromHex('#f2866c'),
              ),
            ),
            Container(
              width: context.width(),
              decoration: BoxDecoration(color: getColorFromHex('#DB7093'), border: Border.all(width: 2, color: appStore.iconColor), borderRadius: BorderRadius.all(Radius.circular(30))),
              child: CupertinoButton(
                disabledColor: getColorFromHex('#DB7093'),
                child: Text('Circular button with custom border color', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Circular button with custom border color');
                },
                // color: getColorFromHex('#f2866c'),
              ),
            ).paddingAll(8),
            Container(
              width: context.width(),
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton(
                child: Text('Disable Button', style: primaryTextStyle(size: 18)),
                onPressed: null,
                disabledColor: Colors.black38,
                color: getColorFromHex('#8998FF'),
              ),
            ),
          ],
        ),
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