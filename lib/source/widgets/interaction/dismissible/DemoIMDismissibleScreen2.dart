import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'DemoIMDismissibleScreen.dart';

class DemoIMDismissibleScreen2 extends StatefulWidget {
  static String tag = '/DemoIMDismissibleScreen2';

  @override
  _DemoIMDismissibleScreen2State createState() => _DemoIMDismissibleScreen2State();
}

class _DemoIMDismissibleScreen2State extends State<DemoIMDismissibleScreen2> {
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

  ListView generateItemsList() {
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(userList[index].tag!),
          child: mDismissibleList(userList[index]),
          background: slideRightBackground(),
          // ignore: missing_return
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              final bool? res = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: appStore.appBarColor,
                      content: Text(
                        "Are you sure you want to delete?",
                        style: primaryTextStyle(),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            "Cancel",
                            style: primaryTextStyle(),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            "Delete",
                            style: primaryTextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            setState(() {
                              userList.removeAt(index);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              return res;
            }
          },
        );
      },
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: primaryTextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.right,
            ),
            20.width,
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: generateItemsList(),
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