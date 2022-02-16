import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWUserAccountDrawerHeaderScreen1 extends StatefulWidget {
  static const tag = '/DemoMWUserAccountDrawerHeaderScreen1';

  @override
  _DemoMWUserAccountDrawerHeaderScreen1State createState() => _DemoMWUserAccountDrawerHeaderScreen1State();
}

class _DemoMWUserAccountDrawerHeaderScreen1State extends State<DemoMWUserAccountDrawerHeaderScreen1> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
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
            child: Text("Click here", style: primaryTextStyle(color: Colors.white)),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: appStore.appBarColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.red),
                accountEmail: Text('leedesigner@gmail.com', style: primaryTextStyle(size: 16, color: Colors.white)),
                accountName: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider('https://miro.medium.com/max/2048/0*0fClPmIScV5pTLoE.jpg'),
                        ),
                      ),
                    ),
                    8.width,
                    Text('Lee \nDesigner', style: primaryTextStyle(size: 16, color: Colors.white)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box, color: appStore.iconColor),
                title: Text('My Account', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "My Account");
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: appStore.iconColor),
                title: Text('Setting', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Setting");
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
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