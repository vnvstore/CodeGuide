import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import 'T2Dashboard.dart';
import '../../utils/AppWidget.dart';


class T2SideMenu extends StatefulWidget {
  static var tag = "/T2SideMenu";

  @override
  T2SideMenuState createState() => T2SideMenuState();
}

class T2SideMenuState extends State<T2SideMenu> {
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
