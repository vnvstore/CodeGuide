import 'package:flutter/material.dart';

class DemoMWRadioScreen extends StatefulWidget {
  static String tag = '/DemoMWRadioScreen';

  @override
  DemoMWRadioScreenState createState() => DemoMWRadioScreenState();
}

class DemoMWRadioScreenState extends State<DemoMWRadioScreen> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  
  var gender;
  var gender1;

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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Simple Radio Button', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.textPrimaryColor),
                    child: Radio(
                      value: 'Male',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          print( "$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Male', style:  TextStyle(fontSize: 16)),
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: appStore.textPrimaryColor,
                    ),
                    child: Radio(
                      value: 'Female',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          print( "$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Female', style: TextStyle(fontSize: 16)),
                  Theme(
                    data: Theme.of(context).copyWith(unselectedWidgetColor: appStore.textPrimaryColor),
                    child: Radio(
                      value: 'Transgender',
                      groupValue: gender,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender = value;
                          print( "$gender Selected");
                        });
                      },
                    ),
                  ),
                  Text('Transgender', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8,),
              
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text('Radio Button Tile', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.textPrimaryColor,
                  ),
                  child: RadioListTile(
                      title: Text(
                        'Radio Button Tile',
                        style: boldTextStyle,
                      ),
                      subtitle: Text(
                        'Simple Radio button tile with title and subtitle',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: 'Radio button tile',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                          print( "$gender1 Selected");
                        });
                      }),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.only(top: 10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.textPrimaryColor,
                  ),
                  child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(
                        'Radio Button Tile',
                        style: boldTextStyle,
                      ),
                      subtitle: Text(
                        'Radio Button on the trailing side',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: 'Radio Button on the trailing side',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                          print( "Radio Button on the trailing side");
                        });
                      }),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: 4,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: appStore.textPrimaryColor,
                  ),
                  child: RadioListTile(
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            'images/widgets/materialWidgets/mwInputSelectionWidgets/Checkbox/profile.png',
                          ).image),
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(
                        'Radio Button Tile',
                        style: boldTextStyle,
                      ),
                      subtitle: Text(
                        'Radio Button Tile with leading and trailing side.',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: 'Female',
                      groupValue: gender1,
                      onChanged: (dynamic value) {
                        setState(() {
                          gender1 = value;
                        });
                      }),
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