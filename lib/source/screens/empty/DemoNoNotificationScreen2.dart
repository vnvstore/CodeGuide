import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoNotificationScreen2 extends StatefulWidget {
  const DemoNoNotificationScreen2({Key? key}) : super(key: key);

  @override
  _DemoNoNotificationScreen2State createState() => _DemoNoNotificationScreen2State();
}

class _DemoNoNotificationScreen2State extends State<DemoNoNotificationScreen2> {
  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              height: 230,
              decoration: BoxDecoration(color: lightGray.withOpacity(0.3), shape: BoxShape.circle),
              child: Image.asset('images/emptyScreen1/checkList.png'),
            ),
            70.height,
            Text('No Notification', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
