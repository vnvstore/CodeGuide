import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/Db7BottomNavigationBar.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';

class DemoDashboard7Footer extends StatefulWidget {
  static String tag = '/DemoDashboard7Footer';

  @override
  DemoDashboard7FooterState createState() => DemoDashboard7FooterState();
}

class DemoDashboard7FooterState extends State<DemoDashboard7Footer> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(),
      //Footer
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: dbShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: Db7BottomNavigationBar(
          items: <Db7BottomNavigationBarItem>[
            Db7BottomNavigationBarItem(icon: db7_ic_home, title: Text("Home", style: TextStyle(fontSize: 16))),
            Db7BottomNavigationBarItem(icon: db7_ic_leaf, title: Text("Service", style: TextStyle(fontSize: 16))),
            Db7BottomNavigationBarItem(icon: db7_ic_chat, title: Text("Notice", style: TextStyle(fontSize: 16))),
            Db7BottomNavigationBarItem(icon: db7_ic_user, title: Text("My", style: TextStyle(fontSize: 16))),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db7_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: db7_colorPrimary, size: 24),
          unselectedItemColor: db7_textColorSecondary,
          selectedItemColor: db7_colorPrimary,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: Db7BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

