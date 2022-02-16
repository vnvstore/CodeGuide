import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppWidget.dart';
import '../utils/T2Dashboard.dart';

class DemoT2SideMenu extends StatefulWidget {
  static var tag = "/DemoT2SideMenu";

  @override
  DemoT2SideMenuState createState() => DemoT2SideMenuState();
}

class DemoT2SideMenuState extends State<DemoT2SideMenu> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      body: Observer(
        builder: (_) => Container(
          color: context.scaffoldBackgroundColor,
          child: SafeArea(
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ),
        ),
      ),
      drawer: T2Drawer(),
    );
  }
}
