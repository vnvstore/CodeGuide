import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils


class DemoCWActionSheetScreen extends StatefulWidget {
  static String tag = '/DemoCWActionSheetScreen';

  @override
  DemoCWActionSheetScreenState createState() => DemoCWActionSheetScreenState();
}

class DemoCWActionSheetScreenState extends State<DemoCWActionSheetScreen> {
  List<ListModel> example = [
    ListModel(name: 'Cupertino action sheet 1'),
    ListModel(name: 'Cupertino action sheet 2'),
    ListModel(name: 'Cupertino action sheet 3'),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final action1 = Theme(
      data:ThemeData.light(),
      child: CupertinoActionSheet(
        title: Text(
          'Cupertino Action Sheet Example',
          style: boldTextStyle(size: 18),
        ),
        message: Text('It\'s a demo for cupertino action sheet.'),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                toasty(context, 'OK');
                finish(context);
              },
              child: Text('OK', style: primaryTextStyle(size: 18)))
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
            },
            child: Text(
              'Cancel',
              style: primaryTextStyle(color: redColor, size: 18),
            )),
      ),
    );

    final action2 = Theme(
      data:ThemeData.light(),
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
              toasty(context, 'Male Clicked');
            },
            child: Text(' 💁‍♂️ Male', style: primaryTextStyle(size: 18)),
            isDefaultAction: true,
          ),
          CupertinoActionSheetAction(
              onPressed: () {
                finish(context);
                toasty(context, 'Female Clicked');
              },
              child: Text(' 💁‍♀️ Female', style: primaryTextStyle(size: 18)))
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
            },
            child: Text(
              'Cancel',
              style: primaryTextStyle(color: redColor, size: 18),
            )),
      ),
    );

    final action3 = Theme(
      data:ThemeData.light(),
      child: CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                toasty(context, 'Share App');
                finish(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Share App',
                    style: primaryTextStyle(size: 18),
                  ),
                  Icon(
                    Icons.share,
                    color: appStore.iconColor,
                  )
                ],
              )),
          CupertinoActionSheetAction(
            onPressed: () {
              toasty(context, 'More by this Developer');
              finish(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'More by this Developer',
                  style: primaryTextStyle(size: 18),
                ),
                Icon(
                  Icons.supervised_user_circle,
                  color: appStore.iconColor,
                )
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              finish(context);
            },
            child: Text(
              'Cancel',
              style: primaryTextStyle(color: redColor, size: 18),
            )),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => action1);
                } else if (index == 1) {
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => action2);
                } else if (index == 2) {
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => action3);
                }
              });
            }),
      ),
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