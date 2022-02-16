import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T2Colors.dart';
import '../utils/T2Strings.dart';
import '../utils/T2Widgets.dart';

class DemoT2SignUp extends StatefulWidget {
  static var tag = "/DemoT2SignUp";

  @override
  DemoT2SignUpState createState() => DemoT2SignUpState();
}

class DemoT2SignUpState extends State<DemoT2SignUp> {
  bool passwordVisible = false;
  bool isRemember = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
        body: Observer(
      builder: (_) => SingleChildScrollView(
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: Column(
            children: <Widget>[
              /*back icon*/
              SafeArea(
                child: Container(
                  color: context.scaffoldBackgroundColor,
                  padding: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              /*heading*/
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25, top: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(t2_lbl_sign_up_header, maxLines: 2, style: boldTextStyle(size: 22, color: appStore.textPrimaryColor)),
                    SizedBox(width: 4),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(t2_lbl_sign_in, maxLines: 2, style: boldTextStyle(size: 22, color: appStore.textSecondaryColor)),
                    )
                  ],
                ),
              ),
              /*content*/
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(t2_hint_email, style: primaryTextStyle(size: 16)),
                    T2EditTextField(isPassword: false),
                    SizedBox(height: 25),
                    Text(t2_hint_password, style: primaryTextStyle(size: 16)),
                    T2EditTextField(isSecure: true),
                    SizedBox(height: 25),
                    Text(t2_hint_re_password, style: primaryTextStyle(size: 16)),
                    T2EditTextField(isSecure: true),
                    SizedBox(height: 50),
                    t2AppButton(
                        textContent: t1_lbl_sign_up,
                        onPressed: () {
                          changeStatusColor(t2White);
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
