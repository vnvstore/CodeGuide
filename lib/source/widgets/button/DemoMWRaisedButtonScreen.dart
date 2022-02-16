import 'package:flutter/material.dart';

class DemoMWRaisedButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWRaisedButtonScreen';

  @override
  DemoMWRaisedButtonScreenState createState() => DemoMWRaisedButtonScreenState();
}

class DemoMWRaisedButtonScreenState extends State<DemoMWRaisedButtonScreen> {
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
              ElevatedButton(
                onPressed: () {
                  print( 'Default Raised button');
                },
                style: ElevatedButton.styleFrom(primary: Color(0xFFDFDFDF)),
                child: Text(
                  'Default Raised button',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
              ),
              Divider(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary:  Color(0xFFDFDFDF)),
                onPressed: () {
                  print( 'Raised button with icon');
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                label: Text(
                  'Raised button with icon',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
              ),
              Divider(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary:  Color(0xFF9C9C9C)),
                onPressed: () {},
                child: Text(
                  'Disable Raised button',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Color(0xFF9C9C9C)),
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: appStore.iconSecondaryColor,
                  ),
                  label: Text(
                    'Disable Raised button icon',
                    style: TextStyle(fontSize: 16),
                  )),
              Divider(),
              ElevatedButton(
                child: Text(
                  'Border Raised button',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
                onPressed: () {
                  print( 'Border Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  print( 'Rounded Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                child: Text(
                  'Rounded Raised button',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  print( 'Customize Rounded Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
                child: Text(
                  'Customize Rounded Raised button',
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  print( 'Customize Text Style of label');
                },
                child: Text(
                  'Customize Text Style of label',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFDFDFDF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  print( 'Color Fill Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff8998FF),
                ),
                child: Text(
                  "Color Fill Raised button",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  print( 'Rounded color fill Raised button');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfff2866c),
                  textStyle: TextStyle(color: Color(0xfff2866c)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: Color(0xfff2866c),
                    ),
                  ),
                ),
                child: Text(
                  'Rounded color fill Raised button',
                  style: TextStyle(fontSize: 16,color: Colors.black),
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