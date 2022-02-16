import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DemoMWDrawerScreen1 extends StatefulWidget {
  static String tag = '/DemoMWDrawerScreen1';

  @override
  _DemoMWDrawerScreen1State createState() => _DemoMWDrawerScreen1State();
}

class _DemoMWDrawerScreen1State extends State<DemoMWDrawerScreen1> {
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
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: appStore.iconColor),
          title: Text('With Multiple Account Selection', style: TextStyle(color: appStore.textPrimaryColor, fontSize: 22)),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture:
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => placeholderWidget(),
                      imageUrl: 'https://miro.medium.com/max/2048/0*0fClPmIScV5pTLoE.jpg',
                      fit: BoxFit.cover,
                    )
                ),

                accountName: Text('john Doe'),
                otherAccountsPictures: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => placeholderWidget(),
                        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkynekYrn6_eDaVJG5l_DTiD_5LAm2_osI0Q&usqp=CAU',
                        fit: BoxFit.cover,
                      )
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => placeholderWidget(),
                        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTD8u1Nmrk78DSX0v2i_wTgS6tW5yvHSD7o6g&usqp=CAU',
                        fit: BoxFit.cover,
                      )
                  ),

                ],
                accountEmail: Text('johndoe@gmail.com'),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.home, color: appStore.iconColor),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  print('Home');
                },
              ),
              ListTile(
                title: Text(
                  "Photos",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.photo, color: appStore.iconColor),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  print('Photos');
                },
              ),
              ListTile(
                title: Text(
                  "Movies",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.movie, color: appStore.iconColor),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  print( 'Movies');
                },
              ),
              ListTile(
                title: Text(
                  "Notification",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.notifications, color: appStore.iconColor),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  print('Notification');
                },
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style:  TextStyle(fontWeight: FontWeight.bold) ,
                ),
                leading: Icon(Icons.settings, color: appStore.iconColor),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  print( 'Settings');
                },
              ),
              Divider(),
              Container(
                padding: EdgeInsets.all(12),
                child: GestureDetector(
                  child: Text(
                    'About Us',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: (){
                    scaffoldKey.currentState!.openEndDrawer();
                    print( 'About us');
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(12),
                child: GestureDetector(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: (){
                    scaffoldKey.currentState!.openEndDrawer();
                    print( 'Privacy Policy');
                  },
                ),
              ),

            ],
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
      ),
    );
  }

  Widget placeholderWidget() => Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);

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
