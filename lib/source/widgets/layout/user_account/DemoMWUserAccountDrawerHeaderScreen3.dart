import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWUserAccountDrawerHeaderScreen3 extends StatefulWidget {
  static const tag = '/DemoMWUserAccountDrawerHeaderScreen3';

  @override
  _DemoMWUserAccountDrawerHeaderScreen3State createState() => _DemoMWUserAccountDrawerHeaderScreen3State();
}

class _DemoMWUserAccountDrawerHeaderScreen3State extends State<DemoMWUserAccountDrawerHeaderScreen3> {
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/background.jpg').image,
                )),
                accountName: Text(
                  "Smith",
                  style: primaryTextStyle(),
                ),
                accountEmail: Text(
                  "Smith12@gmail.com",
                  style: primaryTextStyle(),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user1.png').image,
                  ),
                  CircleAvatar(
                    backgroundImage: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user2.png').image,
                  ),
                ],
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text('Account', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.chevron_right,
                    color: appStore.iconColor,
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Account");
                },
              ),
              ListTile(
                title: Text('Balance', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.chevron_right,
                    color: appStore.iconColor,
                  ),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Balance");
                },
              ),
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