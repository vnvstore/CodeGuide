import 'package:flutter/material.dart';

class DemoMWBottomNavigationScreen4 extends StatefulWidget {
  const DemoMWBottomNavigationScreen4({Key? key}) : super(key: key);

  @override
  _DemoMWBottomNavigationScreen4State createState() => _DemoMWBottomNavigationScreen4State();
}

class _DemoMWBottomNavigationScreen4State extends State<DemoMWBottomNavigationScreen4> {
  List<IconData> navbarIcons = [
    Icons.home,
    Icons.search,
    Icons.add_box,
    Icons.favorite,
    Icons.account_circle,
  ];

  List widgets = <Widget>[
    Center(child: Text("Home View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Search View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Gallery View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Favorite View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
    Center(child: Text("Profile View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold))),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: appStore.cardColor
        ),


        padding: EdgeInsets.only(bottom: 8, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navbarIcons.map(
            (e) {
              int i = navbarIcons.indexOf(e);
              return AnimatedContainer(
                duration: Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  gradient: i == selectedIndex
                      ? LinearGradient(
                          colors: [Colors.blue.shade100, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (i == selectedIndex) ?Container(
                      width: 45,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5)
                        ),
                      ),
                    ):Container(),
                    IconButton(
                      icon: Icon(
                        e,
                        size: 30,
                        color: i == selectedIndex ? Colors.blue : Colors.blueGrey[300],
                      ),
                      onPressed: () {
                        selectedIndex = i;
                        setState(() {});
                      },
                    ),
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
