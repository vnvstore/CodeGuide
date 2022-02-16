import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import '../../../Lipsum.dart' as lipsum;


class DemoCWTabBarScreen2 extends StatefulWidget {
  static const tag = '/DemoCWTabBarScreen2';

  @override
  DemoCWTabBarScreen2State createState() => DemoCWTabBarScreen2State();
}

class DemoCWTabBarScreen2State extends State<DemoCWTabBarScreen2> {
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
    Widget mPage(var value) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              value,
              style: boldTextStyle(),
            )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 16),
              child: Text(
                lipsum.createParagraph(numSentences: 2),
                style: secondaryTextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: appStore.appBarColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            activeColor: appStore.appColorPrimary,
            inactiveColor: Colors.grey,
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return mPage("Home");
              case 1:
                return mPage("Favourite");
              case 2:
                return mPage("Cart");
              default:
                return mPage("Profile");
            }
          },
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}