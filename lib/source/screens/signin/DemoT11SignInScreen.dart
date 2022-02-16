import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T11Images.dart';
import '../utils/T11Strings.dart';
import '../utils/T11Widget.dart';


class DemoT11SignInScreen extends StatefulWidget {
  static String tag = '/DemoT11SignInScreen';

  @override
  DemoT11SignInScreenState createState() => DemoT11SignInScreenState();
}

class DemoT11SignInScreenState extends State<DemoT11SignInScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.appBarColor, statusBarIconBrightness: Brightness.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonCacheImageWidget(t11_ic_music_logo, 100, width: 100),
            16.height,
            t11EditTextStyle(t11_hint_Email, TextFieldType.NAME),
            8.height,
            t11EditTextStyle(t11_hint_password, TextFieldType.PASSWORD),
            8.height,
            Align(
              alignment: Alignment.centerRight,
              child: Text(t11_lbl_forgot_your_password, style: secondaryTextStyle()),
            ),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(24, backgroundColor: appStore.appColorPrimary),
              width: context.width(),
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              child: Text(t11_lbl_login, style: boldTextStyle(color: white)),
            ).onTap(() {
              finish(context);
            }),
            16.height,
            createRichText(
              list: <TextSpan>[
                TextSpan(text: t11_lbl_need_an_account + ' ', style: secondaryTextStyle()),
                TextSpan(
                  text: t11_lbl_sign_up,
                  style: secondaryTextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
