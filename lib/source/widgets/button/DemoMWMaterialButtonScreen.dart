import 'package:flutter/material.dart';

class DemoMWMaterialButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWMaterialButtonScreen';

  @override
  _DemoMWMaterialButtonScreenState createState() => _DemoMWMaterialButtonScreenState();
}

class _DemoMWMaterialButtonScreenState extends State<DemoMWMaterialButtonScreen> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

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
              MaterialButton(
                onPressed: () {
                  print( 'Default Material button');
                },
                child: Text(
                  'Default Material button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              TextButton.icon(
                  onPressed: () {
                    print( 'Material button with icon');
                  },
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconColor,
                  ),
                  label: Text(
                    'Material button with icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              MaterialButton(
                onPressed: null,
                child: Text(
                  'Disable Material button',
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
                    'Disable Material button icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              MaterialButton(
                onPressed: () {
                  print( 'Border Material button');
                },
                shape: Border.all(color: appStore.iconColor!),
                child: Text(
                  'Border Material button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  print( 'Rounded Material button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    )),
                child: Text(
                  'Rounded Material button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  print( 'Customize Rounded Material button');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    )),
                child: Text(
                  'Customize Rounded Material button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              MaterialButton(
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    )),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  print( 'Color Fill Material button');
                },
                color: Color(0xff8998FF),
                child: Text(
                  "Color Fill Material button",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Divider(),
              MaterialButton(
                onPressed: () {
                  print( 'Rounded color fill Material button');
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color(0xfff2866c),
                child: Text(
                  'Rounded color fill Material button',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
              Divider(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff8998FF),
                    Color(0xff75D7D3),
                  ]),
                ),
                child: MaterialButton(
                  onPressed: () {
                    print( 'Gradient Material button');
                  },
                  splashColor: Colors.transparent,
                  child: Text(
                    'Gradient Material button',
                    style: TextStyle(fontSize: 16,color: Colors.white),
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