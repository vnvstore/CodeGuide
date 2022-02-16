import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoNotificationScreen4 extends StatefulWidget {
  const DemoNoNotificationScreen4({Key? key}) : super(key: key);

  @override
  _DemoNoNotificationScreen4State createState() => _DemoNoNotificationScreen4State();
}

class _DemoNoNotificationScreen4State extends State<DemoNoNotificationScreen4> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF9D49FF));
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF9D49FF),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/box.png'),
              height: 230,
              decoration: BoxDecoration(color: Color(0xFF9544F8), shape: BoxShape.circle),
            ),
            70.height,
            Text('No Notification', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
