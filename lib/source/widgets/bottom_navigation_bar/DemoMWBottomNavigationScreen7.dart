import 'package:flutter/material.dart';

class DemoMWBottomNavigationScreen7 extends StatefulWidget {
  const DemoMWBottomNavigationScreen7({Key? key}) : super(key: key);

  @override
  _DemoMWBottomNavigationScreen7State createState() => _DemoMWBottomNavigationScreen7State();
}

class _DemoMWBottomNavigationScreen7State extends State<DemoMWBottomNavigationScreen7> {
  List<SampleListModel> sampleData = [];

  int selectedIndex = 0;

  @override
  void initState() {
    sampleData.add(
      SampleListModel(
        title: "Home",
        launchWidget: Text("Home View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.home,
        colors: Colors.blue,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Search",
        launchWidget: Text("Search View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.search,
        colors: Colors.orange,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Gallery",
        launchWidget: Text("Gallery View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.add_box,
        colors: Colors.red,
      ),
    );
    sampleData.add(
      SampleListModel(
        title: "Favorite",
        launchWidget: Text("Favorite View", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        icon: Icons.favorite,
        colors: Colors.red,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:sampleData[selectedIndex].launchWidget),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appStore.cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            sampleData.length,
            (i) {
              SampleListModel data = sampleData[i];

              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                  color: i == selectedIndex ? data.colors!.withAlpha(100) : appStore.cardColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: i == selectedIndex
                    ? Center(child:Text(data.title??"", style: TextStyle(color: Colors.blue, fontSize: 16)))
                    : GestureDetector(
                        child: Icon(data.icon, size: 30),
                        onTap: (){
                          selectedIndex = i;
                          setState(() {});
                        },
                      )
              );
            },
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