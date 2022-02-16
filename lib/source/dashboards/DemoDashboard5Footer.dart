import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/Db5BottomNavigationBar.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';

class DemoDashboard5Footer extends StatefulWidget {
  static String tag = '/DemoDashboard5Footer';

  @override
  DemoDashboard5FooterState createState() => DemoDashboard5FooterState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard5FooterState extends State<DemoDashboard5Footer> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db5_colorPrimary);
    return Scaffold(
      backgroundColor: db5_white,
      body: SafeArea(
        child: Container(),
      ),
      //Footer
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: dbShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: Db5BottomNavigationBar(
          items: <Db5BottomNavigationBarItem>[
            Db5BottomNavigationBarItem(
              icon: db5_ic_home,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_compass,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_msg,
            ),
            Db5BottomNavigationBarItem(
              icon: db5_ic_setting,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db5_icon_color, size: 24),
          selectedIconTheme: IconThemeData(color: db5_colorPrimary, size: 24),
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: Db5BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}

