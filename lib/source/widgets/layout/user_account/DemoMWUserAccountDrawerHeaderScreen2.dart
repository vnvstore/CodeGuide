import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWUserAccountDrawerHeaderScreen2 extends StatefulWidget {
  static const tag = '/DemoMWUserAccountDrawerHeaderScreen2';

  @override
  _DemoMWUserAccountDrawerHeaderScreen2State createState() => _DemoMWUserAccountDrawerHeaderScreen2State();
}

class _DemoMWUserAccountDrawerHeaderScreen2State extends State<DemoMWUserAccountDrawerHeaderScreen2> {
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
      drawer: Drawer(
        child: Container(
          color: appStore.appBarColor,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text("John Smith", style: primaryTextStyle(color: white)),
                accountEmail: Text("John@gmail.com", style: secondaryTextStyle(size: 14, color: white)),
                currentAccountPicture: CircleAvatar(backgroundImage: Image.asset('images/widgets/materialWidgets/mwLayoutWidgtes/MWUserAccountDrawerHeaderWidget/ic_user1.png').image),
              ),
              ListTile(
                leading: Icon(Icons.category, color: appStore.iconColor),
                title: Text('Category', style: primaryTextStyle()),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Category");
                },
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box, color: appStore.iconColor),
                title: Text('Account', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
                ),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  toasty(context, "Account");
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: appStore.iconColor),
                title: Text('Balance', style: primaryTextStyle()),
                trailing: Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.chevron_right, color: appStore.iconColor),
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
      body: Center(
        child: GestureDetector(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius: BorderRadius.circular(8),),
            padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Text("Click here", style: primaryTextStyle(color: Colors.white)),
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