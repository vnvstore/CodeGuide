import 'package:flutter/material.dart';

class DemoMWFlatButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWFlatButtonScreen';

  @override
  DemoMWFlatButtonScreenState createState() => DemoMWFlatButtonScreenState();
}

class DemoMWFlatButtonScreenState extends State<DemoMWFlatButtonScreen> {
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
              TextButton(
                onPressed: () {
                  print( 'Default Flat button');
                },
                child: Text(
                  'Default Flat button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              TextButton.icon(
                  onPressed: () {
                    print( 'Flat button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Flat button with icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              TextButton(
                onPressed: null,
                child: Text(
                  'Disable Flat button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Flat button icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              TextButton(
                onPressed: () {
                  print( 'Border Flat button');
                },
                style: TextButton.styleFrom(
                    //shape: Border.all(color: appStore.iconColor!),
                    ),
                child: Text(
                  'Border Flat button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  print( 'Rounded Flat button');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                child: Text(
                  'Rounded Flat button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  print( 'Customize Rounded Flat button');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                child: Text(
                  'Customize Rounded Flat button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  print( 'Customize Text Style of label');
                },
                child: Text(
                  'Customize Text Style of label',
                  style: TextStyle(
                    color: appStore.textPrimaryColor,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  print( 'Color Fill Flat button');
                },
                style: TextButton.styleFrom(
                  backgroundColor:Color(0xFF8998FF),
                  primary: Color(0xFF8998FF),
                ),
                child: Text(
                  "Color Fill Flat button",
                  style: TextStyle(fontSize:16,color: Colors.white),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  print( 'Rounded color fill flat button');
                },
                style: TextButton.styleFrom(
                  backgroundColor:Color(0xFFf2866c),
                    primary: Color(0xFFf2866c),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'Rounded color fill flat button',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
              Divider(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF8998FF),
                    Color(0xFF75D7D3),
                  ]),
                ),
                child: TextButton(
                  onPressed: () {
                    print( 'Gradient Flat button');
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.transparent
                  ),
                  //splashColor: Colors.transparent,
                  child: Text(
                    'Gradient Flat button',
                    style: TextStyle(fontSize:16, color: Colors.white),
                  ),
                ),
              )
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