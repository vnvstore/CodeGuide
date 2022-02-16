import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T1Strings.dart';
import '../utils/T1Widget.dart';

class DemoT1Search extends StatefulWidget {
  static var tag = "/DemoT1Search";

  @override
  DemoT1SearchState createState() => DemoT1SearchState();
}

class DemoT1SearchState extends State<DemoT1Search> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Observer(
          builder: (_) => Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: boxDecoration(bgColor: context.scaffoldBackgroundColor, radius: 10, showShadow: true),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    autofocus: true,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: context.scaffoldBackgroundColor,
                      hintText: t1_lbl_search,
                      hintStyle: primaryTextStyle(),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: appStore.iconColor),
                      contentPadding: EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Expanded(child: Container(child: ring(t1_lbl_welcome_to_search_bar))),
            ],
          ),
        ));
  }
}
