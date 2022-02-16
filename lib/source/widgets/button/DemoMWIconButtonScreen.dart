import 'package:flutter/material.dart';

class DemoMWIconButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWIconButtonScreen';

  @override
  DemoMWIconButtonScreenState createState() => DemoMWIconButtonScreenState();
}

class DemoMWIconButtonScreenState extends State<DemoMWIconButtonScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.file_upload,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    print( "upload");
                  },
                ),
              ),
              SizedBox(height: 10,),
              IconButton(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save_alt,
                    ),
                    SizedBox(width: 10,),
                    Text('Download', style: TextStyle(fontSize: 16)),
                  ],
                ),
                onPressed: () {
                  print( 'download');
                },
              ),
              SizedBox(height: 10,),
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.greenAccent,
                  shape: CircleBorder(side: BorderSide(width: 2, color: Colors.black)),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    print( "Share");
                  },
                ),
              ),
              SizedBox(height: 10,),
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: appStore.iconColor,
                ),
                iconSize: 30,
                onPressed: () {
                  print( "Message");
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