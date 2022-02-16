import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/country_code_picker.dart';
import '../utils/T5Verification.dart';
import '../utils/T5Colors.dart';
import '../utils/T5Constant.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';

class DemoT5SignUp extends StatefulWidget {
  static String tag = '/DemoT5SignUp';

  @override
  DemoT5SignUpState createState() => DemoT5SignUpState();
}

class DemoT5SignUpState extends State<DemoT5SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          color: context.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                  placeholder: (context, url) => placeholderWidget(),
                  imageUrl: t5_ragistration, width: width / 2.5, height: width / 2.5),
              text(t5_heading_login, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 22.0),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 16),
                child: text(t5_note_registration, textColor: t5TextColorSecondary, fontFamily: fontMedium, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
              ),
              Container(
                margin: EdgeInsets.all(24),
                decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, showShadow: true, radius: 4.0),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: t5ViewColor, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print, showFlag: true),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                                hintText: t5_hint_phone_no,
                                hintStyle: TextStyle(color: t5TextColorThird),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        T5Verification().launch(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: width / 8,
                        child: text(t5_continue, textColor: t5White, isCentered: true),
                        decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 8.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
