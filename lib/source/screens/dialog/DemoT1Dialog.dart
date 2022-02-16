import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T1Profile.dart';
import '../utils/T1Colors.dart';
import '../utils/T1Constant.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';


class DemoT1Dialog extends StatelessWidget {
  static var tag = "/DemoT1Dialog";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return Observer(
      builder: (_) => T1Profile(),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close, color: appStore.iconColor),
            ),
          ),
          text("Congratulations!", textColor: Colors.green, fontFamily: fontBold, fontSize: textSizeLarge),
          SizedBox(height: 24),
          Image.asset(t1_ic_dialog, color: Colors.green, width: 95, height: 95),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: text(t1_sample_text, textColor: appStore.textSecondaryColor, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: t1_colorPrimary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(24),
            ),
            alignment: Alignment.center,
            child: text(t1_lbl_try_again, textColor: t1_white, fontFamily: fontMedium, fontSize: textSizeNormal),
          )
        ],
      ));
}
