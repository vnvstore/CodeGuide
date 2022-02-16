import 'package:flutter/material.dart';

class DemoMWTabBarScreen1 extends StatefulWidget {
  static String tag = "/DemoMWTabBarScreen1";

  @override
  _DemoMWTabBarScreen1State createState() => _DemoMWTabBarScreen1State();
}

class _DemoMWTabBarScreen1State extends State<DemoMWTabBarScreen1> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.appBarColor,
            iconTheme: IconThemeData(color: appStore.iconColor),
            title: Text(
              'Simple TabBar',
              style: TextStyle(color: appStore.textPrimaryColor, fontSize: 20,fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              indicatorColor: Colors.blue,
              labelColor: appStore.textPrimaryColor,
              labelStyle: boldTextStyle,
              tabs: [
                Tab(
                  text: "Home",
                ),
                Tab(
                  text: "Articles",
                ),
                Tab(
                  text: "User",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Articles',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
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

  Color? textPrimaryColor;
  Color? iconColorPrimaryDark;
  Color? scaffoldBackground;
  Color? backgroundColor;
  Color? backgroundSecondaryColor;
  Color? appColorPrimaryLightColor;
  Color? textSecondaryColor;
  Color? appBarColor;
  Color? iconColor;
  Color? iconSecondaryColor;
  Color? cardColor;

  AppStore(){

    textPrimaryColor = Color(0xFF212121);
    iconColorPrimaryDark = Color(0xFF212121);
    scaffoldBackground = Color(0xFFEBF2F7);
    backgroundColor = Colors.black;
    backgroundSecondaryColor = Color(0xFF131d25);
    appColorPrimaryLightColor = Color(0xFFF9FAFF);
    textSecondaryColor = Color(0xFF5A5C5E);
    appBarColor = Colors.white;
    iconColor = Color(0xFF212121);
    iconSecondaryColor = Color(0xFFA8ABAD);
    cardColor = Color(0xFF191D36);

  }
}