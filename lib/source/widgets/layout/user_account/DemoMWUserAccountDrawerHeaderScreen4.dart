import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWUserAccountDrawerHeaderScreen4 extends StatefulWidget {
  static const tag = '/DemoMWUserAccountDrawerHeaderScreen4';

  @override
  _DemoMWUserAccountDrawerHeaderScreen4State createState() => _DemoMWUserAccountDrawerHeaderScreen4State();
}

class _DemoMWUserAccountDrawerHeaderScreen4State extends State<DemoMWUserAccountDrawerHeaderScreen4> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 500));
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius:BorderRadius.circular(8)),
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Text(
              "Click here",
              style: primaryTextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: appStore.appBarColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("John Smith"),
                accountEmail: Text("john@gmail.com"),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/background.jpg'),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user2.png'),
                ),
              ),
              ListTile(
                title: Text('My Account', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "My Account");
                },
              ),
              ListTile(
                title: Text('Setting', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Setting");
                },
              ),
              ListTile(
                title: Text('Logout', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Logout");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}