import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWNavigationBarScreen extends StatefulWidget {
  static String tag = '/DemoCWNavigationBarScreen';

  @override
  DemoCWNavigationBarScreenState createState() => DemoCWNavigationBarScreenState();
}

class DemoCWNavigationBarScreenState extends State<DemoCWNavigationBarScreen> {
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            spacing: 8,
            direction: Axis.horizontal,
            children: [
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: Theme(
                  data: ThemeData.light(),
                  child: CupertinoNavigationBarBackButton(
                    color: appStore.iconColor,
                    onPressed: () {
                      toasty(context, "Back button");
                    },
                  ),
                ),
                middle: Text(
                  'Center Title',
                  style: boldTextStyle(),
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: CupertinoNavigationBarBackButton(
                  color: appStore.iconColor,
                  previousPageTitle: 'With Back Icon',
                  onPressed: () {
                    toasty(context, "Back button");
                  },
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                automaticallyImplyLeading: true,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        toasty(context, "Back button");
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: appStore.iconColor,
                      ),
                    ),
                  ],
                ),
                middle: Text(
                  'Single Action',
                  style: boldTextStyle(),
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () {
                      toasty(context, "Settings");
                    },
                    child: Icon(
                      Icons.settings,
                      color: appStore.iconColor,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        toasty(context, "Drawer");
                      },
                      child: Icon(Icons.menu, color: appStore.iconColor, size: 25),
                    ),
                    8.width,
                    Expanded(child: Text("Page Title", style: boldTextStyle()))
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        toasty(context, "Search");
                      },
                      child: Icon(Icons.search, color: appStore.iconColor, size: 25),
                    ),
                    16.width,
                    GestureDetector(
                      onTap: () {
                        toasty(context, "Menu");
                      },
                      child: Icon(Icons.more_vert, color: appStore.iconColor, size: 25),
                    ),
                  ],
                ),
              ),
              CupertinoNavigationBar(
                transitionBetweenRoutes: false,
                backgroundColor: appStore.appBarColor,
                leading: CupertinoNavigationBarBackButton(
                  previousPageTitle: 'With Single Action',
                  color: appStore.iconColor,
                  onPressed: () {
                    toasty(context, "Back button");
                  },
                ),
                trailing: CupertinoButton(
                  padding: EdgeInsets.all(4),
                  child: GestureDetector(
                    onTap: () {
                      toasty(context, "Profile");
                    },
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider('https://www.attractivepartners.co.uk/wp-content/uploads/2017/06/profile.jpg'),
                    ),
                  ),
                  onPressed: () {},
                ),
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
