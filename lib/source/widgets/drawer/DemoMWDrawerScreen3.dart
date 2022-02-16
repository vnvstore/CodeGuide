import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoMWDrawerScreen3 extends StatefulWidget {
  const DemoMWDrawerScreen3({Key? key}) : super(key: key);

  @override
  _DemoMWDrawerScreen3State createState() => _DemoMWDrawerScreen3State();
}

class _DemoMWDrawerScreen3State extends State<DemoMWDrawerScreen3> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  List<SampleListModel> getData = [];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool d1Open = false;

  late int isSelected = 0;

  closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    d1Open = false;
    setStatusBarColor(appStore.scaffoldBackground!);
  }

  openDrawer() {
    xOffset = 200;
    yOffset = 80;
    scaleFactor = 0.8;
    d1Open = true;
    setStatusBarColor(Color(0xff335a5a));
    setState(() {});
  }

  @override
  void initState() {
    setStatusBarColor(appStore.scaffoldBackground!);
    getData.add(
      SampleListModel(
        title: "Home",
        icon: Icons.home,
        launchWidget: Center(child: Text("Home View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Profile",
        icon: Icons.account_box_rounded,
        launchWidget: Center(child: Text("Profile View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Notification",
        icon: Icons.notifications_none,
        launchWidget:
            Center(child: Text("Notification View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Stats",
        icon: Icons.stacked_bar_chart,
        launchWidget: Center(child: Text("Stats View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Schedule",
        icon: Icons.access_time,
        launchWidget:
            Center(child: Text("Schedule View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Settings",
        icon: Icons.settings,
        launchWidget:
            Center(child: Text("Settings View", style: boldTextStyle)),
      ),
    );
    init();
    super.initState();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 1)).then((value) => openDrawer());
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xff335a5a),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 16, top: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.account_circle,
                              color: Colors.white, size: 50),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rebeca Babara',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text('Designer',
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 16)),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 24,
                  ),
                  ...List.generate(
                    getData.length,
                    (index) {
                      SampleListModel data = getData[index];
                      return ListTile(
                        title: Text(
                          data.title ?? "",
                          style: TextStyle(
                            color: isSelected == index
                                ? Colors.white
                                : Colors.white54,
                          ),
                        ),
                        leading: Icon(
                          data.icon,
                          color: isSelected == index
                              ? Colors.white
                              : Colors.white54,
                        ),
                        onTap: () {
                          isSelected = index;
                          closeDrawer();
                          setState(() {});
                        },
                      );
                    },
                  ),
                  Spacer(),
                  Container(

                    padding: EdgeInsets.only(left: 16, bottom: 24),
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.logout,color: Colors.white),
                          SizedBox(width: 5,),
                          Text("Logout",style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      onTap: () {
                        closeDrawer();
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                closeDrawer();
                setState(() {});
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: d1Open
                      ? BorderRadius.circular(16)
                      : BorderRadius.circular(0),
                ),
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(scaleFactor),
                child: SafeArea(
                  child: Container(
                    alignment: Alignment.center,
                    color: appStore.scaffoldBackgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(d1Open ? Icons.arrow_back : Icons.menu,size: 24),
                              onPressed: () {
                                if (d1Open) {
                                  closeDrawer();
                                } else {
                                  xOffset = 200;
                                  yOffset = 80;
                                  scaleFactor = 0.8;
                                  d1Open = true;
                                  setStatusBarColor(Color(0xff335a5a));
                                }
                                setState(() {});
                              },
                            ),
                            SizedBox(width: 8,),
                            Text('Hello, User',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    getData[isSelected].launchWidget ?? Container(),
                                    SizedBox(height: 16,),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:MaterialStateProperty.all<Color>(appStore.textPrimaryColor!),
                                        padding: MaterialStateProperty.all(const EdgeInsets.only(left: 15, right: 15)),
                                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Go Back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              onPanUpdate: (d) {
                closeDrawer();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

  //change status bar color
  Future<void> setStatusBarColor(
    Color statusBarColor, {
    Color? systemNavigationBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    int delayInMilliSeconds = 200,
  }) async {
    await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      ),
    );
  }
}

class SampleListModel {
  Widget? leading;
  String? title;
  String? subTitle;
  Widget? trailing;
  IconData? icon;
  IconData? alternateIcon;
  Function? onTap;
  Color? colors;
  Widget? launchWidget;

  SampleListModel(
      {this.leading,
      this.title,
      this.subTitle,
      this.colors,
      this.icon,
      this.alternateIcon,
      this.trailing,
      this.onTap,
      this.launchWidget});
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
  Color? scaffoldBackgroundColor;

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
    scaffoldBackgroundColor = Color(0xFFEFEFEF);
  }
}
