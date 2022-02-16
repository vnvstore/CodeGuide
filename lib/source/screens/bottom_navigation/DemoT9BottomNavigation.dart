import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T9BottomNavigationBar.dart';
import '../utils/T9Colors.dart';
import '../utils/T9Images.dart';

class DemoT9BottomNavigation extends StatefulWidget {
  static String tag = '/DemoT9BottomNavigation';

  @override
  DemoT9BottomNavigationState createState() => DemoT9BottomNavigationState();
}

class DemoT9BottomNavigationState extends State<DemoT9BottomNavigation> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      backgroundColor: t9_layout_background,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: shadowColorGlobal, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5),
          ],
          color: context.scaffoldBackgroundColor,
        ),
        child: T9BottomNavigationBar(
          backgroundColor: context.scaffoldBackgroundColor,
          items: <T9BottomNavigationBarItem>[
            T9BottomNavigationBarItem(icon: t9_ic_home_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_search_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_chart_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_message_navigation),
            T9BottomNavigationBarItem(icon: t9_ic_more_navigation),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: t9_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: t9_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: T9BottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: context.scaffoldBackgroundColor,
          body: Container(
            padding: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: appStore.appBarColor,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: t9_colorPrimary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
    );
  }
}
