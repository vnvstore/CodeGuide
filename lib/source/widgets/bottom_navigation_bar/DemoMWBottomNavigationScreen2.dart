import 'package:flutter/material.dart';

class DemoMWBottomNavigationScreen2 extends StatefulWidget {
  static String tag = '/DemoMWBottomNavigationScreen2';

  @override
  DemoMWBottomNavigationScreen2State createState() => DemoMWBottomNavigationScreen2State();
}

class DemoMWBottomNavigationScreen2State extends State<DemoMWBottomNavigationScreen2> {
  int currentIndex2 = 0;
  final example2 = [
    Text('Example 2', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Reels', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('New Photo', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Activity', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
    Text('Profile', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 24)),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; 
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            example2.elementAt(currentIndex2),
            SizedBox(height: 15,),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText('This example consists of only icons selected items changes it colors.'),
                SizedBox(height: 5,),
                bulletText('Bottom Navigation type is Fixed(Default Type).'),
                SizedBox(height: 5,),
                bulletText('Use when there are less than five items.'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex2 = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: appStore.appBarColor,
        unselectedItemColor: appStore.iconSecondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex2,
        items: [
          //1
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Home',
            backgroundColor: appStore.appBarColor,
          ),
          //2
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Reels',
          ),
          //3
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Gallery',
          ),
          //4
          BottomNavigationBarItem(
            icon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart.png', height: 25, width: 25, color: appStore.iconSecondaryColor),
            activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart_fill.png', height: 25, width: 25, color: appStore.iconColor),
            label: 'Activity',
          ),
          //5
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconSecondaryColor!, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30),
              ),

            ),
            activeIcon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: appStore.iconColor!, width: 1)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30)
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("•  ", style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14)),
      Expanded(child: Text(text, style: TextStyle(color: appStore.textPrimaryColor, fontSize: 14))),
    ],
  );
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

  }
}