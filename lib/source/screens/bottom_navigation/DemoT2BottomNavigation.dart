import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../utils/AppWidget.dart';
import '../utils/T2BubbleBotoomBar.dart';
import '../utils/T2Colors.dart';
import '../utils/T2Strings.dart';
import '../utils/T2Widgets.dart';

class DemoT2BottomNavigation extends StatefulWidget {
  static var tag = "/DemoT2BottomNavigation";

  @override
  DemoT2BottomNavigationState createState() => DemoT2BottomNavigationState();
}

class DemoT2BottomNavigationState extends State<DemoT2BottomNavigation> {
  var currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.white);

    return Scaffold(
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          onTap: changePage,
          hasNotch: false,
          hasInk: true,
          inkColor: t2_colorPrimaryLight,
          items: <BubbleBottomBarItem>[
            tab(Icons.home, t2_lbl_home),
            tab(Icons.favorite_border, t2_lbl_favourite),
            tab(Icons.notifications_none, t2_lbl_notification),
            tab(Icons.person_outline, t2_lbl_profile),
          ],
        ),
        body: Observer(
          builder: (_) => Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Center(
                child: Container(
                  width: 180,
                  child: ring(t2_lbl_welcome_to_bottom_n_navigation_baar),
                ),
              ),
            ],
          ),
        ));
  }
}
