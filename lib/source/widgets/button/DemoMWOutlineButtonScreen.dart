import 'package:flutter/material.dart';

class DemoMWOutlineButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWOutlineButtonScreen';

  @override
  DemoMWOutlineButtonScreenState createState() => DemoMWOutlineButtonScreenState();
}

class DemoMWOutlineButtonScreenState extends State<DemoMWOutlineButtonScreen> {
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
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: appStore.textPrimaryColor!, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                ),
                onPressed: () {
                  print( 'Default Outline button');
                },
                child: Text(
                  'Default Outline button',
                  style:  TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: appStore.textPrimaryColor!, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 0.8, //width of the border
                    ),
                  ),
                  onPressed: () {
                    print( 'Outline button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Outline button with icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: appStore.textPrimaryColor!, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Disable Outline button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: appStore.textPrimaryColor!, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width: 0.8, //width of the border
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Outline button icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    //shape: Border.all(color: appStore.iconColor!),
                    color: appStore.textPrimaryColor!, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                ),
                onPressed: () {
                  print( 'Border Outline button');
                },
                child: Text(
                  'Border Outline button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: appStore.textPrimaryColor!, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                onPressed: () {
                  print( 'Rounded Outline button');
                },
                child: Text(
                  'Rounded Outline button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: appStore.textPrimaryColor!, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                onPressed: () {
                  print( 'Customize Rounded Outline button');
                },
                child: Text(
                  'Customize Rounded Outline button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: appStore.textPrimaryColor!, //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 0.8, //width of the border
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
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