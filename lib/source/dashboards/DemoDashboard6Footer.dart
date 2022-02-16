import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/Db6BottomNavigationBar.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard6Footer extends StatefulWidget {
  static String tag = '/DemoDashboard6Footer';

  @override
  DemoDashboard6FooterState createState() => DemoDashboard6FooterState();
}

const fontMedium = 'Medium';
const fontBold = 'Bold';

class DemoDashboard6FooterState extends State<DemoDashboard6Footer> {

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;

  }

  Widget db6Label(var text) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 18, color: db6_black, fontFamily: fontMedium)),
          Text(db6_lbl_view_all, style: TextStyle(fontSize: 14, color: db6_textColorSecondary)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db6_colorPrimary);
    return Scaffold(
      body: NestedScrollView(
        //Header
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar()
          ];
        },
        body: Container(),
      ),

      //Footer
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: dbShadowColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5)]),
        child: Db6BottomNavigationBar(
          items: <Db6BottomNavigationBarItem>[
            Db6BottomNavigationBarItem(icon: db6_ic_home, title: Text(db6_lbl_home, style: TextStyle(color: db6_textColorSecondary))),
            Db6BottomNavigationBarItem(icon: db6_ic_pin, title: Text(db6_lbl_nearby, style: TextStyle(color: db6_textColorSecondary))),
            Db6BottomNavigationBarItem(icon: db6_ic_basket, title: Text(db6_lbl_booking, style: TextStyle(color: db6_textColorSecondary))),
            Db6BottomNavigationBarItem(icon: db6_ic_sale, title: Text(db6_lbl_Offers, style: TextStyle(color: db6_textColorSecondary))),
            Db6BottomNavigationBarItem(icon: db6_ic_user, title: Text(db6_lbl_profile, style: TextStyle(color: db6_textColorSecondary))),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: db6_textColorSecondary, size: 24),
          selectedIconTheme: IconThemeData(color: db6_colorPrimary, size: 24),
          selectedLabelStyle: TextStyle(color: db6_colorPrimary),
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: Db6BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}

