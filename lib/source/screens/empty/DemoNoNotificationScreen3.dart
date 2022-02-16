import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoNotificationScreen3 extends StatefulWidget {
  const DemoNoNotificationScreen3({Key? key}) : super(key: key);

  @override
  _DemoNoNotificationScreen3State createState() => _DemoNoNotificationScreen3State();
}

class _DemoNoNotificationScreen3State extends State<DemoNoNotificationScreen3> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            70.height,
            Column(
              children: [
                Text('No Notification', style: boldTextStyle(size: 20)),
                16.height,
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: primaryTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 60),
              ],
            ),
            100.height,
            Container(
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/mobileTick.png'),
              height: 230,
              decoration: BoxDecoration(color: lightGray.withOpacity(0.3), shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
