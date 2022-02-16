import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils



class DemoMWSnackBarScreen extends StatefulWidget {
  static String tag = '/DemoMWSnackBarScreen';

  @override
  DemoMWSnackBarScreenState createState() => DemoMWSnackBarScreenState();
}

class DemoMWSnackBarScreenState extends State<DemoMWSnackBarScreen> {
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
    ListModel(name: 'Simple SnackBar'),
    ListModel(name: 'SnackBar with Action'),
    ListModel(name: 'Custom SnackBar'),
    ListModel(name: 'Infinite SnackBar'),
    ListModel(name: 'Floating SnackBar'),
    ListModel(name: 'Rounded SnackBar'),
    ListModel(name: 'Bordered SnackBar'),
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
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: appStore.cardBackgroundBlackDark,
                content: Text('This is simple SnackBar', style: primaryTextStyle(color: Colors.white)),
              ));
            } else if (index == 1) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appStore.cardBackgroundBlackDark,
                  content: Text('This is SnackBar with Action', style: primaryTextStyle(color: Colors.white)),
                  action: SnackBarAction(
                      label: 'Undo',
                      textColor: Colors.white,
                      onPressed: () {
                        Fluttertoast.showToast(msg: 'Undo pressed');
                      }),
                ),
              );
            } else if (index == 2) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is custom SnackBar', style: primaryTextStyle(color: Colors.white)),
                backgroundColor: appStore.appColorPrimary,
              ));
            } else if (index == 3) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: appStore.cardBackgroundBlackDark,
                content: Text('This is infinite SnackBar with some info', style: primaryTextStyle(color: Colors.white)),
                duration: Duration(days: 365),
                action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {
                      ScaffoldMessengerState().hideCurrentSnackBar();
                    }),
              ));
            } else if (index == 4) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: appStore.cardBackgroundBlackDark,
                content: Text('This is Floating SnackBar', style: primaryTextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
              ));
            } else if (index == 5) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: appStore.cardBackgroundBlackDark,
                content: Text('This is Rounded SnackBar', style: primaryTextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(borderRadius: radius(30)),
                behavior: SnackBarBehavior.floating,
              ));
            } else if (index == 6) {
              ScaffoldMessengerState().hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('This is Bordered SnackBar', style: primaryTextStyle(color: appStore.textPrimaryColor)),
                shape: Border.all(color: appStore.appColorPrimary!),
                backgroundColor: appStore.appBarColor,
                behavior: SnackBarBehavior.floating,
              ));
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
  Color cardBackgroundBlackDark = Color(0xFF1F1F1F);

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