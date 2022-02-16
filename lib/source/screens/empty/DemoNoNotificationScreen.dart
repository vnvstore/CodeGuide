import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/SemiCircleClipper.dart';

class DemoNoNotificationScreen extends StatefulWidget {
  const DemoNoNotificationScreen({Key? key}) : super(key: key);

  @override
  _DemoNoNotificationScreenState createState() => _DemoNoNotificationScreenState();
}

class _DemoNoNotificationScreenState extends State<DemoNoNotificationScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFFC655));
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
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: SemiCircleClipper(),
                  child: Container(
                    height: context.height() * 0.5,
                    decoration: BoxDecoration(color: Color(0xFFFFC655)),
                  ),
                ),
                150.height,
                Text('No Notification', style: boldTextStyle(size: 20)),
                16.height,
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: secondaryTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 60),
              ],
            ),
            Image.asset('images/emptyScreen1/bell.png', height: 180),
          ],
        ),
      ),
    );
  }
}
