import 'package:flutter/material.dart';

class DemoMWTabBarScreen3 extends StatefulWidget {
  static String tag = "/DemoMWTabBarScreen3";

  @override
  _DemoMWTabBarScreen3State createState() => _DemoMWTabBarScreen3State();
}

class _DemoMWTabBarScreen3State extends State<DemoMWTabBarScreen3>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.appBarColor,
            iconTheme: IconThemeData(color: appStore.iconColor),
            title: Text(
              'TabBar with Icon',
              style: TextStyle(
                  color: appStore.textPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              controller: _tabController,
              onTap: (index) {
                print(index);
              },
              indicatorColor: Colors.blue,
              tabs: [
                Tab(
                    icon: Image.asset(
                  'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/home.png',
                  height: 25,
                  width: 25,
                  color: _tabController!.index != 0
                      ? appStore.iconSecondaryColor
                      : Colors.blue,
                )),
                Tab(
                    icon: Image.asset(
                  'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/marketplace.png',
                  height: 25,
                  width: 25,
                  color: _tabController!.index != 1
                      ? appStore.iconSecondaryColor
                      : Colors.blue,
                )),
                Tab(
                    icon: Image.asset(
                  'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/group.png',
                  height: 25,
                  width: 25,
                  color: _tabController!.index != 2
                      ? appStore.iconSecondaryColor
                      : Colors.blue,
                )),
                Tab(
                    icon: Image.asset(
                  'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/video.png',
                  height: 25,
                  width: 25,
                  color: _tabController!.index != 3
                      ? appStore.iconSecondaryColor
                      : Colors.blue,
                )),
                Tab(
                    icon: Image.asset(
                  'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/notification.png',
                  height: 25,
                  width: 25,
                  color: _tabController!.index != 4
                      ? appStore.iconSecondaryColor
                      : Colors.blue,
                )),
                Tab(
                    icon: Image.asset(
                  'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/list.png',
                  height: 25,
                  width: 25,
                  color: _tabController!.index != 5
                      ? appStore.iconSecondaryColor
                      : Colors.blue,
                )),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
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
                      style:
                          TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    )
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
                      'Marketplace',
                      style:
                          TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    )
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
                      'Groups',
                      style:
                          TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    )
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
                      'Watch',
                      style:
                          TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    )
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
                      'Notifications',
                      style:
                          TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    )
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
                      'Menu',
                      style:
                          TextStyle(color: appStore.textPrimaryColor, fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    )
                  ],
                ),
              ),
            ],
          ),
    ));
  }
}

AppStore appStore = AppStore();

class AppStore {
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

  AppStore() {
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
