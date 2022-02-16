import 'package:flutter/material.dart';

class DemoMWNavigationRailScreen1 extends StatefulWidget {
  const DemoMWNavigationRailScreen1({Key? key}) : super(key: key);

  @override
  _DemoMWNavigationRailScreen1State createState() => _DemoMWNavigationRailScreen1State();
}

class _DemoMWNavigationRailScreen1State extends State<DemoMWNavigationRailScreen1> {
  List widgets = <Widget>[
    Center(child: Text("Home View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Profile View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Notifications View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Stats View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Schedule View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Settings View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
  ];

  int _selectedIndex = 0;
  String title = 'D4screen';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              extended: isExpanded,
              onDestinationSelected: (int index) {
                _selectedIndex = index;
                setState(() {});
              },
              trailing: Container(
                padding: EdgeInsets.only(top: 64),
                child: IconButton(
                  icon: Icon(isExpanded ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios, color: Colors.blue),
                  onPressed: () {
                    isExpanded = !isExpanded;
                    setState(() {});
                  },
                ),
              ),
              leading: AnimatedContainer(
                duration: Duration(milliseconds:400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle, size: 50, color: appStore.iconColor),
                    isExpanded?Text('Rebeca Babara', style: TextStyle(fontSize: 20)):Container(),
                    isExpanded?Text('Designer', style: TextStyle(fontSize: 14)):Container(),
                  ],
                ),
              ),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.home, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_box_rounded),
                  label: Text('Profile', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.account_box_rounded, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.notifications_none),
                  label: Text('Notifications', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.notifications_none, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.stacked_bar_chart),
                  label: Text('Stats', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.stacked_bar_chart, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.access_time),
                  label: Text('Schedule', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.access_time, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings', style: TextStyle(fontSize: 16)),
                  selectedIcon: Icon(Icons.settings, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
            VerticalDivider(width: 0),
            Expanded(
              child: widgets[_selectedIndex],
            )
          ],
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