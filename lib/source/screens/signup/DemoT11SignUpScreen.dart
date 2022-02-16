import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';

class DemoT11SignUpScreen extends StatefulWidget {
  static String tag = '/DemoT11SignUpScreen';

  @override
  DemoT11SignUpScreenState createState() => DemoT11SignUpScreenState();
}

class DemoT11SignUpScreenState extends State<DemoT11SignUpScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget(t11_ic_music_logo, 100, width: 100),
            16.height,
            t11EditTextStyle(t11_hint_Email, TextFieldType.NAME),
            8.height,
            t11EditTextStyle(t11_hint_password, TextFieldType.PASSWORD),
            8.height,
            t11EditTextStyle(t11_hint_confirm_password, TextFieldType.PASSWORD),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(24, backgroundColor: appStore.appColorPrimary),
              width: context.width(),
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              child: Text(t11_lbl_sign_up, style: boldTextStyle(color: white)),
            ).onTap(() {
              finish(context);
            }),
            16.height,
            createRichText(
              list: <TextSpan>[
                TextSpan(text: t11_lbl_already_member + ' ', style: secondaryTextStyle()),
                TextSpan(
                  text: t11_lbl_login,
                  style: secondaryTextStyle(color: Colors.blue),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
