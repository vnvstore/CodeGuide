import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoMWDrawerScreen5 extends StatefulWidget {
  const DemoMWDrawerScreen5({Key? key}) : super(key: key);

  @override
  _DemoMWDrawerScreen5State createState() => _DemoMWDrawerScreen5State();
}

class _DemoMWDrawerScreen5State extends State<DemoMWDrawerScreen5> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  
  List<SampleListModel> getData = [];

  late int isSelected = 0;

  double value = 0;

  bool d1Open = false;

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
        launchWidget: Center(child: Text("Notification View", style: boldTextStyle)),
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
        launchWidget: Center(child: Text("Schedule View", style: boldTextStyle)),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Settings",
        icon: Icons.settings,
        launchWidget: Center(child: Text("Settings View", style: boldTextStyle)),
      ),
    );
    init();
    super.initState();
  }

  void closeDrawer() {
    value = 0;
    d1Open = false;
    setStatusBarColor(appStore.scaffoldBackground!);
  }

  openDrawer() {
    value = 1;
    d1Open = true;
    setStatusBarColor(Colors.blue.shade400);
    setState(() {});
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade400,
                    Colors.blue.shade800,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Icon(Icons.account_circle, color: Colors.white, size: 70),
                          SizedBox(height: 8,),
                          Text('Rebeca Babara', style: TextStyle(color:Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    SizedBox(height:32,),
                    Column(
                      children: [
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 250),
              builder: (_, double val, __) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: GestureDetector(
                    onTap: () {
                      closeDrawer();
                      setState(() {});
                    },
                    onPanUpdate: (d) {
                      closeDrawer();
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: d1Open ? BorderRadius.circular(16):BorderRadius.circular(0),
                        color: appStore.scaffoldBackground
                      ),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(d1Open ? Icons.arrow_back : Icons.menu, size: 24),
                                  onPressed: () {
                                    if (d1Open) {
                                      closeDrawer();
                                    } else {
                                      value = 1;
                                      d1Open = true;
                                      setStatusBarColor(Colors.blue.shade400);
                                    }
                                    setState(() {});
                                  },
                                ),
                                SizedBox(width:8),
                                Text('Hello, User', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        getData[isSelected].launchWidget??Container(),
                                        SizedBox(height:16,),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(appStore.textPrimaryColor!),
                                            padding: MaterialStateProperty.all(const EdgeInsets.only(left:15,right: 15)),
                                            shadowColor:MaterialStateProperty.all(Colors.transparent),
                                          ),

                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Go Back',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),

                                      ],
                                    )
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                );
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

  SampleListModel({this.leading, this.title, this.subTitle, this.colors, this.icon, this.alternateIcon, this.trailing, this.onTap, this.launchWidget});
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