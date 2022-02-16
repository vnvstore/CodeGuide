import 'package:flutter/material.dart';

class DemoMWBottomNavigationScreen5 extends StatefulWidget {
  const DemoMWBottomNavigationScreen5({Key? key}) : super(key: key);

  @override
  _DemoMWBottomNavigationScreen5State createState() => _DemoMWBottomNavigationScreen5State();
}

class _DemoMWBottomNavigationScreen5State extends State<DemoMWBottomNavigationScreen5> {
  List<IconData> navbarIcons = [Icons.home, Icons.search, Icons.add_box, Icons.favorite, Icons.account_circle];
  List widgets = <Widget>[
    Center(child: Text("Home View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Search View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Gallery View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Favorite View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Profile View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
  ];

  List<String> bottomNavigationName = ['Home', 'Search', 'Gallery', 'Favorite', 'Profile'];

  List<Color> color = [Colors.blue, Colors.orange, Colors.purple, Colors.red, Colors.green];

  List<Color> colorShade = [Colors.blue.shade100, Colors.orange.shade100, Colors.purple.shade100, Colors.red.shade100, Colors.green.shade100];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 16, left: 12, right: 12, top: 8),
        height: 70,
        decoration: BoxDecoration(
          color: appStore.cardColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navbarIcons.map(
            (e) {
              int i = navbarIcons.indexOf(e);
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(8),
                height: 45,
                decoration: BoxDecoration(
                  color: i == selectedIndex ? colorShade[i] : appStore.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      child:Icon(
                        e,
                        size: 30,
                        color: i == selectedIndex ? color[i] : Colors.blueGrey[300],
                      ),
                      onTap: () {
                        selectedIndex = i;
                        setState(() {});
                      }
                    ),

                    (i == selectedIndex)
                        ?
                        Container(
                          padding:EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(bottomNavigationName[i], style: TextStyle(color: color[i],fontWeight: FontWeight.bold))
                        )
                        :Container(),

                  ],
                ),
              );
            },
          ).toList(),
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