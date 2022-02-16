import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T8Colors.dart';
import '../utils/T8Constant.dart';
import '../utils/T8Strings.dart';
import '../utils/T8Widget.dart';

class DemoT8SignUp extends StatefulWidget {
  static String tag = '/DemoT8SignUp';

  @override
  DemoT8SignUpState createState() => DemoT8SignUpState();
}

class DemoT8SignUpState extends State<DemoT8SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.scaffoldBackgroundColor);

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: context.scaffoldBackgroundColor,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24),
                  text(t8_title_new_account, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontBold),
                  text(t8_info_sign_up, textColor: appStore.textSecondaryColor, isLongText: true, isCentered: true),
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, showShadow: true, radius: 10),
                    child: Column(
                      children: <Widget>[
                        d8EditTextStyle(t8_hint_your_email, isPassword: false),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t8_lbl_already_have_an_account, textColor: appStore.textSecondaryColor),
                  text(t8_lbl_sign_in, textColor: t8_colorPrimary, textAllCaps: true),
                  SizedBox(height: 80),
                  Container(margin: EdgeInsets.all(24.0), child: T8Button(textContent: t8_lbl_create_account, onPressed: () {}))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
