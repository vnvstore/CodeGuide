import 'package:flutter/material.dart';

class DemoMWBottomNavigationScreen6 extends StatefulWidget {
  const DemoMWBottomNavigationScreen6({Key? key}) : super(key: key);

  @override
  _DemoMWBottomNavigationScreen6State createState() => _DemoMWBottomNavigationScreen6State();
}

class _DemoMWBottomNavigationScreen6State extends State<DemoMWBottomNavigationScreen6> {
  List<SampleListModel> SampleData = [];

  int selectedIndex = 0;

  @override
  void initState() {
    SampleData.add(
      SampleListModel(
        title: "Home",
        launchWidget: Text("Home View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.home,
        alternateIcon: Icons.home_outlined,
        colors: Colors.blue,
      ),
    );
    SampleData.add(
      SampleListModel(
        title: "Search",
        launchWidget: Text("Search View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.search,
        alternateIcon: Icons.search,
        colors: Colors.orange,
      ),
    );
    SampleData.add(
      SampleListModel(
        title: "Favorite",
        launchWidget: Text("Favorite View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.favorite,
        alternateIcon: Icons.favorite_outline,
        colors: Colors.red,
      ),
    );
    SampleData.add(
      SampleListModel(
        title: "Profile",
        launchWidget: Text("Profile View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.account_circle,
        alternateIcon: Icons.account_circle_outlined,
        colors: Colors.purple,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SampleData[selectedIndex].launchWidget),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appStore.backgroundColor,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          print("Hurray");
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: appStore.cardColor,
        clipBehavior: Clip.hardEdge,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              ...List.generate(
                SampleData.length,
                (index) {
                  SampleListModel data = SampleData[index];
                  return Expanded(
                    child: GestureDetector(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            selectedIndex == index ? Icon(data.icon, size: 24, color: data.colors) : Icon(data.alternateIcon, size: 24, color: Colors.blueGrey[300]),
                            Text(selectedIndex == index ? data.title??"" : "", style: TextStyle(color: data.colors, fontSize: 14)),
                          ],
                        ),
                      ),
                      onTap: (){
                        selectedIndex = index;
                        setState(() {});
                      },
                    ),
                  );

                },
              ),
            ],
          ),
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