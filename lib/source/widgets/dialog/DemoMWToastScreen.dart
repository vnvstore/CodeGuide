import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoMWToastScreen extends StatefulWidget {
  static String tag = '/DemoMWToastScreen';

  @override
  DemoMWToastScreenState createState() => DemoMWToastScreenState();
}

class DemoMWToastScreenState extends State<DemoMWToastScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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

  List<ListModel> example = [
    ListModel(name: 'Simple Toast'),
    ListModel(name: 'Error Toast'),
    ListModel(name: 'Top Gravity'),
    ListModel(name: 'Center Gravity'),
    ListModel(name: 'Long Toast'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      key: scaffoldKey,
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              toasty(context, 'This is simple Toast');
            } else if (index == 1) {
              toasty(context, "This is error Toast", bgColor:  Colors.redAccent, textColor: whiteColor, gravity: ToastGravity.BOTTOM);
            } else if (index == 2) {
              toasty(context, 'This is in top Toast', gravity: ToastGravity.TOP);
            } else if (index == 3) {
              toasty(context, 'Hello ,I\'m in center', gravity: ToastGravity.CENTER);
            } else if (index == 4) {
              toasty(context, 'This toast will display for long time', length: Toast.LENGTH_LONG);
            }
          });
        },
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
  Color? appColorPrimary;

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
    appColorPrimary = Color(0xFF1157FA);

  }
}
class ListModel {
  String? name;
  bool? isNew;
  Widget? widget;

  ListModel({this.name, this.widget,this.isNew});
}
class ExampleItemWidget extends StatelessWidget {
  final ListModel tabBarType;
  final Function onTap;
  final bool showTrailing;

  ExampleItemWidget(this.tabBarType, {required this.onTap, this.showTrailing = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: appStore.appBarColor,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      elevation: 2.0,
      shadowColor: Colors.black,
      child: ListTile(
        onTap: () => onTap(),
        title: Text(tabBarType.name!, style: boldTextStyle()),
        trailing: showTrailing
            ? Icon(Icons.arrow_forward_ios, size: 15, color: appStore.textPrimaryColor)
            : tabBarType.isNew.validate()
            ? Text('New', style: secondaryTextStyle(color: Colors.red))
            : null,
      ),
    );
  }
}