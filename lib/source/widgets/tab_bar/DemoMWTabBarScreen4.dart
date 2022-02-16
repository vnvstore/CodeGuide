import 'package:flutter/material.dart';

class DemoMWTabBarScreen4 extends StatefulWidget {
  static String tag = "/DemoMWTabBarScreen4";

  @override
  _DemoMWTabBarScreen4State createState() => _DemoMWTabBarScreen4State();
}

class _DemoMWTabBarScreen4State extends State<DemoMWTabBarScreen4> {
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
    return SafeArea(
      child: DefaultTabController(
        length: 19,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.appBarColor,
            iconTheme: IconThemeData(color: appStore.iconColor),
            title: Text(
              'Scrollable Tab',
              style: TextStyle(color: appStore.textPrimaryColor, fontSize: 20,fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              isScrollable: true,
              labelStyle: boldTextStyle,
              indicatorColor: Colors.blue,
              unselectedLabelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(child: TabList(title: 'Home')),
                Tab(child: TabList(title: 'MarketPlace')),
                Tab(child: TabList(title: 'Group')),
                Tab(child: TabList(title: 'Watch')),
                Tab(child: TabList(title: 'Notifications')),
                Tab(child: TabList(title: 'Menu')),
                Tab(child: TabList(title: 'Profile')),
                Tab(child: TabList(title: 'Setting')),
                Tab(child: TabList(title: 'Message')),
                Tab(child: TabList(title: 'Call')),
                Tab(child: TabList(title: 'Library')),
                Tab(child: TabList(title: 'Category')),
                Tab(child: TabList(title: 'Cart')),
                Tab(child: TabList(title: 'Wishlist')),
                Tab(child: TabList(title: 'Order')),
                Tab(child: TabList(title: 'Report')),
                Tab(child: TabList(title: 'Favourite')),
                Tab(child: TabList(title: 'Wallet')),
                Tab(child: TabList(title: 'Settings')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              mTabContent("Home"),
              mTabContent("MarketPlace"),
              mTabContent("Group"),
              mTabContent("Watch"),
              mTabContent("Notifications"),
              mTabContent("Menu"),
              mTabContent("Profile"),
              mTabContent("Setting"),
              mTabContent("Message"),
              mTabContent("Call"),
              mTabContent("Library"),
              mTabContent("Category"),
              mTabContent("Cart"),
              mTabContent("Wishlist"),
              mTabContent("Order"),
              mTabContent("Report"),
              mTabContent("Favourite"),
              mTabContent("Wallet"),
              mTabContent("Settings"),
            ],
          ),
        ),
      ),
    );
  }

  Widget mTabContent(String title) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      width: width,
      child: Text(title, style: TextStyle(fontSize: 24)),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TabList({Widget? icon, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon == null ? SizedBox() : icon,
        SizedBox(width: 10,),
        Text(
          title,
          style: TextStyle(color: appStore.textPrimaryColor),
        ),
      ],
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