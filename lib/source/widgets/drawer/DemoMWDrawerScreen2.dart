import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DemoMWDrawerScreen2 extends StatefulWidget {
  static String tag = '/DemoMWDrawerScreen2';

  @override
  _DemoMWDrawerScreen2State createState() => _DemoMWDrawerScreen2State();
}

class _DemoMWDrawerScreen2State extends State<DemoMWDrawerScreen2> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextStyle primaryTextStyle = TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appStore.appBarColor,
        title: Text('With Custom Shape', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 22)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu,color: appStore.iconColor),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 40),
            decoration: BoxDecoration(
              color: appStore.appBarColor,
            ),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(8),
                      child: IconButton(
                        icon: Icon(
                          Icons.power_settings_new,
                          color: appStore.textPrimaryColor,
                        ),
                        onPressed: () {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.orange),
                        image: DecorationImage(image: CachedNetworkImageProvider('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTD8u1Nmrk78DSX0v2i_wTgS6tW5yvHSD7o6g&usqp=CAU')),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "John Dow",
                      style: TextStyle(color: appStore.textPrimaryColor, fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    Text("JohnDoe@gmail.com", style: TextStyle(color: appStore.textPrimaryColor, fontSize: 16.0)),
                    SizedBox(height: 30,),
                    
                    itemList(Icon(Icons.home, color: appStore.iconColor), "Home"),
                    Divider(),
                    SizedBox(height: 15,),
                    itemList(Icon(Icons.person_pin, color: appStore.iconColor), "My profile"),
                    Divider(),
                    SizedBox(height: 15,),
                    itemList(Icon(Icons.message, color: appStore.iconColor), "Messages"),
                    Divider(),
                    SizedBox(height: 15,),
                    itemList(Icon(Icons.notifications, color: appStore.iconColor), "Notifications"),
                    Divider(),
                    SizedBox(height: 15,),
                    itemList(Icon(Icons.settings, color: appStore.iconColor), "Settings"),
                    Divider(),
                    SizedBox(height: 15,),
                    itemList(Icon(Icons.email, color: appStore.iconColor), "Contact us"),
                    Divider(),
                    SizedBox(height: 15,),
                    itemList(Icon(Icons.info_outline, color: appStore.iconColor), "Help"),
                    Divider(),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Text('Open Drawer', style: primaryTextStyle),
          padding: EdgeInsets.all(16),
          color: appStore.textPrimaryColor,
        ),
      ),
    );
  }

  Widget itemList(Widget icon, String title) {
    return GestureDetector(
      child: Row(
        children: [
          icon,
          SizedBox(width: 10,),
          Text(title, style: TextStyle(color: appStore.textPrimaryColor)),
        ],
      ),
      onTap: () {
        scaffoldKey.currentState!.openEndDrawer();
        print( title);
      },
    );

  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4), size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
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