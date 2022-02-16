import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoCWAlertDialogScreen extends StatefulWidget {
  static String tag = '/DemoCWAlertDialogScreen';

  @override
  DemoCWAlertDialogScreenState createState() => DemoCWAlertDialogScreenState();
}

class DemoCWAlertDialogScreenState extends State<DemoCWAlertDialogScreen> {
  List<ListModel> example = [
    ListModel(name: 'Alert Dialog'),
    ListModel(name: 'Alert Dialog with Title'),
    ListModel(name: 'Alert Dialog with Selection'),
  ];

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
    void displayAlertDialog1() {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => Theme(
            data: ThemeData.light(),
                child: CupertinoAlertDialog(
                  title: Text(
                    'Logout?',
                    style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  content: Text(
                    'Are you sure want to logout?',
                    style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'Cancel',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Cancel');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Logout',
                        style: primaryTextStyle(color: redColor, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Logout');
                        finish(context);
                      },
                    )
                  ],
                ),
              ));
    }

    void displayAlertDialog2() {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => Theme(
            data: ThemeData.light(),
                child: CupertinoAlertDialog(
                  title: Text(
                    'Allow "Maps to access your location while you use the app?',
                    style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  content: Text(
                    'your current location will be displayed on the map and used for directions,nearby search results, and estimated travel times',
                    style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'Don\'t Allow',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Don\'t Allow');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Allow',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, ' Allow');
                        finish(context);
                      },
                    )
                  ],
                ),
              ));
    }

    void displayAlertDialog3() {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => Theme(
            data: ThemeData.light(),
                child: CupertinoAlertDialog(
                  title: Text(
                    'Select favorite Desert',
                    style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'CheeseCake',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'CheeseCake');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Chocolate Brownie',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Chocolate Brownie');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Hazelnut',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Hazelnut');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Apple Pie',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, ' Apple Pie');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Cancel',
                        style: primaryTextStyle(color: Colors.red, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Cancel');
                        finish(context);
                      },
                    ),
                  ],
                ),
              ));
    }

    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(example[index], onTap: () {
                  if (index == 0) {
                    displayAlertDialog1();
                  } else if (index == 1) {
                    displayAlertDialog2();
                  } else if (index == 2) {
                    displayAlertDialog3();
                  }
                });
              })),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

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