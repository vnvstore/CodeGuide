import 'package:flutter/material.dart';

class DemoMWFloatingActionButtonScreen extends StatefulWidget {
  static String tag = '/DemoMWFloatingActionButtonScreen';

  @override
  DemoMWFloatingActionButtonScreenState createState() => DemoMWFloatingActionButtonScreenState();
}

class DemoMWFloatingActionButtonScreenState extends State<DemoMWFloatingActionButtonScreen> {

  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  
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
              Text(
                "Default FAB Button",
                style: boldTextStyle,
              ),
              FloatingActionButton(
                heroTag: '1',
                elevation: 5,
                onPressed: () {
                  print( 'Default FAB Button');
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              Divider(),
              Text(
                "Label FAB Button",
                style: boldTextStyle,
              ),
              FloatingActionButton(
                heroTag: '2',
                backgroundColor: Color(0xff8998FF),
                child: Text(
                  'Add',
                  style: TextStyle(fontSize:16,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print( 'Label FAB Button');
                },
              ),
              Divider(),
              Text(
                "Circle Border FAB",
                style: boldTextStyle,
              ),
              FloatingActionButton(
                  heroTag: '3',
                  shape: CircleBorder(side: BorderSide(color: Colors.black)),
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print( 'Circle Border FAB button');
                  }),
              Divider(),
              Text(
                "Rounded Rectangle Border FAB",
                style: boldTextStyle,
              ),
              SizedBox(height: 10,),
              Center(
                child: FloatingActionButton(
                    heroTag: '4',
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print( 'Rounded Rectangle Border FAB');
                    }),
              ),
              Divider(),
              Text(
                "Icon with Label Fab",
                style: boldTextStyle,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                      heroTag: '5',
                      label: Text(
                        "Add",
                        style: TextStyle(fontSize:16, color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print( 'Icon with Label Fab');
                      }),
                  SizedBox(width: 10,),
                  FloatingActionButton.extended(
                      heroTag: '6',
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      label: Text(
                        "Take pic",
                        style: TextStyle(fontSize:16,color: Colors.white),
                      ),
                      backgroundColor: Colors.deepOrangeAccent,
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print( 'Icon with Label Fab');
                      }),
                  Divider(),
                ],
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