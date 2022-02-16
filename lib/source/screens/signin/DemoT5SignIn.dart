import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T5Colors.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';
import '../dialog/DemoT5Dialog.dart';

class DemoT5SignIn extends StatefulWidget {
  static String tag = '/DemoT5SignIn';

  @override
  DemoT5SignInState createState() => DemoT5SignInState();
}

class DemoT5SignInState extends State<DemoT5SignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5White);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(t5_login, width: width / 2.5, height: width / 2.5),
              text(t5_heading_login, textColor: appStore.textPrimaryColor, fontFamily: 'Bold', fontSize: 22.0),
              Container(
                margin: EdgeInsets.all(24),
                decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, showShadow: true, radius: 4),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    EditText(
                      hint: t5_hint_phone_no,
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    EditText(hint: t5_hint_password, isSecure: true),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        toasty(context, t5_forgot_pswd);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                        child: text(t5_forgot_pswd, textColor: t5ColorPrimary, fontSize: 18.0, fontFamily: 'Semibold'),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              toasty(context, "Sign in clicked");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
                              alignment: Alignment.center,
                              height: width / 8,
                              child: text(t5_sign_in, textColor: t5White, isCentered: true),
                              decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 8),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog(),
                              );
                            },
                            child: SvgPicture.asset(t5_img_fingerprint, width: width / 8.2, color: t5ViewColor))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
