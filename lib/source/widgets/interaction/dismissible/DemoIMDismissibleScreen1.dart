import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

import 'DemoIMDismissibleScreen.dart';

class DemoIMDismissibleScreen1 extends StatefulWidget {
  static String tag = '/DemoIMDismissibleScreen1';

  @override
  _DemoIMDismissibleScreen1State createState() => _DemoIMDismissibleScreen1State();
}

class _DemoIMDismissibleScreen1State extends State<DemoIMDismissibleScreen1> {
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

  Widget generateItemsList() {
    return Container(
      child: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(userList[index].tag!),
            child: mDismissibleList(userList[index]),
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessengerState().showSnackBar(SnackBar(content: Text("Swipe to left")));
              } else if (direction == DismissDirection.endToStart) {
                userList.removeAt(index);
                ScaffoldMessengerState().showSnackBar(SnackBar(content: Text("Swipe to right")));
              }
            },
          );
        },
      ),
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            20.width,
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: primaryTextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
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
