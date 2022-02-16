import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T5SignIn.dart';
import '../utils/T5Colors.dart';
import '../utils/T5Constant.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';


class DemoT5Dialog extends StatefulWidget {
  static var tag = "/DemoT5Dialog";

  @override
  DemoT5DialogState createState() => DemoT5DialogState();
}

class DemoT5DialogState extends State<DemoT5Dialog> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return T5SignIn();
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
  var width = MediaQuery.of(context).size.width;

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
          child: Container(padding: EdgeInsets.all(16), alignment: Alignment.centerRight, child: Icon(Icons.close, color: appStore.iconColor)),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(shape: BoxShape.circle, color: t5SkyBlue),
          child: Icon(Icons.done, color: t5White),
        ),
        SizedBox(height: 24),
        text(them5_lbl_fingerprint_authentication, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 16, top: 10),
          child: text(t5_note_user_fingerprint, textColor: t5TextColorSecondary, fontFamily: fontMedium, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
        ),
        SizedBox(height: 30),
        GestureDetector(onTap: () {}, child: SvgPicture.asset(t5_img_fingerprint, width: width / 4, color: t5ColorPrimary)),
        SizedBox(height: 50),
      ],
    ),
  );
}
