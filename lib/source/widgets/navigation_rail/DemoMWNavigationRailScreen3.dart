import 'package:flutter/material.dart';

class DemoMWNavigationRailScreen3 extends StatefulWidget {
  const DemoMWNavigationRailScreen3({Key? key}) : super(key: key);

  @override
  _DemoMWNavigationRailScreen3State createState() => _DemoMWNavigationRailScreen3State();
}

class _DemoMWNavigationRailScreen3State extends State<DemoMWNavigationRailScreen3> {
  List widgets = <Widget>[
    Center(child: Text("Popular View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Favorites View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("Inspiration View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
    Center(child: Text("All View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
  ];

  int _selectedIndex = 3;

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
        body: Row(
          children: [
            NavigationRail(
              selectedLabelTextStyle: TextStyle(color: Colors.white),
              unselectedLabelTextStyle: TextStyle(color: Colors.white54),
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.blueGrey,
              onDestinationSelected: (int index) {
                _selectedIndex = index;
                setState(() {});
              },
              groupAlignment: 0.9,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Popular", style: TextStyle(fontSize:16, color: Colors.white, decoration: _selectedIndex == 0 ? TextDecoration.underline : TextDecoration.none)),
                  ),
                ),
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Favorites", style: TextStyle(fontSize:16, color: Colors.white, decoration: _selectedIndex == 1 ? TextDecoration.underline : TextDecoration.none)),
                  ),
                ),
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Inspiration", style: TextStyle(fontSize:16, color: Colors.white, decoration: _selectedIndex == 2 ? TextDecoration.underline : TextDecoration.none)),
                  ),
                ),
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("All", style: TextStyle(fontSize:16, color: Colors.white, decoration: _selectedIndex == 3 ? TextDecoration.underline : TextDecoration.none)),
                  ),
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
