import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'utils/Db4BubbleBotoomBar.dart';
import 'utils/DbColors.dart';
import 'utils/DbImages.dart';
import 'utils/DbStrings.dart';

class DemoDashboard4Footer extends StatefulWidget {
  static String tag = '/DemoDashboard4Footer';

  @override
  DemoDashboard4FooterState createState() => DemoDashboard4FooterState();
}
const fontMedium = 'Medium';
class DemoDashboard4FooterState extends State<DemoDashboard4Footer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(db4_colorPrimary);

    var width = MediaQuery.of(context).size.width;
    width = width - 50;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: db4_colorPrimary,
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(),
      ),
      bottomNavigationBar: Db4BottomBar(),
    );
  }

  void changeStatusColor(Color color) async {
    setStatusBarColor(color);
  }

}

class Db4BottomBar extends StatefulWidget {
  static String tag = '/T5BottomBar';

  @override
  Db4BottomBarState createState() => Db4BottomBarState();
}

class Db4BottomBarState extends State<Db4BottomBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: currentIndex,
      elevation: 8,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      hasNotch: false,
      hasInk: true,
      inkColor: db4_ColorPrimaryLight,
      items: <BubbleBottomBarItem>[
        tab(db4_ic_home, db4_home),
        tab(db4_list_check, db4_lbl_listing),
        tab(db4_ic_notification, db4_notification),
        tab(db4_user, db4_lbl_profile),
      ],
    );
  }
}

