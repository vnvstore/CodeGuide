import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T6Colors.dart';
import '../utils/T6Constant.dart';
import '../utils/T6Images.dart';
import '../utils/T6Strings.dart';
import '../utils/T6Widget.dart';

class DemoT6BottomNavigation extends StatefulWidget {
  static String tag = '/DemoT6BottomNavigation';

  @override
  DemoT6BottomNavigationState createState() => DemoT6BottomNavigationState();
}

class DemoT6BottomNavigationState extends State<DemoT6BottomNavigation> {
  var isSelected = 1;

  Widget tabItem(var pos, var icon, var name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: isSelected == pos ? BoxDecoration(shape: BoxShape.rectangle, color: t6colorPrimary, borderRadius: BorderRadius.circular(8)) : BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: isSelected == pos ? t6white : t6textColorSecondary,
                ),
                text(name, textColor: isSelected == pos ? t6white : t6textColorSecondary, fontSize: textSizeSmall)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            height: 70,
            decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: shadowColorGlobal,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: tabItem(1, t6_ic_activity, t6_lbl_activity),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(2, t6_ic_list, t6_lbl_health),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(3, t6_ic_meal, t6_lbl_meals),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(4, t6_ic_work_bn, t6_lbl_work),
                  flex: 1,
                ),
                Flexible(
                  child: tabItem(5, t6_ic_sleep, t6_lbl_sleep),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: 180,
            alignment: Alignment.center,
            child: ring(t6_lbl_welcome_to_bottom_n_navigation_bar),
          ),
          TopBar(
            titleName: t6_lbl_bottom_navigation,
          ),
        ],
      ),
    );
  }
}
