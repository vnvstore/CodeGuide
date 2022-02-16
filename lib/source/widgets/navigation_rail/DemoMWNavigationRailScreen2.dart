import 'package:flutter/material.dart';

class DemoMWNavigationRailScreen2 extends StatefulWidget {
  const DemoMWNavigationRailScreen2({Key? key}) : super(key: key);

  @override
  _DemoMWNavigationRailScreen2State createState() => _DemoMWNavigationRailScreen2State();
}

class _DemoMWNavigationRailScreen2State extends State<DemoMWNavigationRailScreen2> {
  int _selectedIndex = 0;

  List widgets = <Widget>[
    Center(child: Text("Home View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Profile View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Schedule View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Settings View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  backgroundColor: Colors.teal,
                  labelType: NavigationRailLabelType.all,
                  selectedLabelTextStyle: TextStyle(color: Colors.white,fontSize: 16),
                  unselectedLabelTextStyle: TextStyle(color: Colors.white,fontSize: 14),
                  groupAlignment: 0.0,
                  onDestinationSelected: (int index) {
                    _selectedIndex = index;
                    setState(() {});
                  },
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(Icons.home, color: Colors.white),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('Home'),
                        )

                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(Icons.account_box, color: Colors.white),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('Profile'),
                        )
                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(Icons.access_time, color: Colors.white),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('Schedule'),
                        )

                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text('Settings'),
                        )
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: widgets[_selectedIndex],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
