import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/T1Colors.dart';
import '../utils/T1Images.dart';
import '../utils/T1Strings.dart';
import '../utils/T1Widget.dart';

class DemoT1BottomNavigation extends StatefulWidget {
  static var tag = "/DemoT1BottomNavigation";

  @override
  DemoT1BottomNavigationState createState() => DemoT1BottomNavigationState();
}

class DemoT1BottomNavigationState extends State<DemoT1BottomNavigation> {
  var isSelected = 1;

  @override
  Widget build(BuildContext context) {
    Widget tabItem(var pos, var icon) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = pos;
          });
        },
        child: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: isSelected == pos ? BoxDecoration(shape: BoxShape.circle, color: t1_colorPrimary_light) : BoxDecoration(),
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: isSelected == pos ? t1_colorPrimary : Color(0xFF5A5C5E),
          ),
        ),
      );
    }

    return Scaffold(
      body: Observer(
        builder: (_) => ring(t1_lbl_welcome_to_bottom_n_navigation_baar).center(),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 60,
            decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(color: shadowColorGlobal, blurRadius: 10, spreadRadius: 2, offset: Offset(0, 3.0)),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  tabItem(1, t1_home),
                  tabItem(2, t1_notification),
                  Container(width: 45, height: 45),
                  tabItem(3, t1_settings),
                  tabItem(4, t1_user),
                ],
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              backgroundColor: t1_colorPrimary,
              onPressed: () {
                //
              },
              child: Icon(Icons.mic, color: t1_white),
            ),
          )
        ],
      ),
    );
  }
}
