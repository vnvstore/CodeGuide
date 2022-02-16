import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoTaskDoneScreen3 extends StatefulWidget {
  const DemoTaskDoneScreen3({Key? key}) : super(key: key);

  @override
  _DemoTaskDoneScreen3State createState() => _DemoTaskDoneScreen3State();
}

class _DemoTaskDoneScreen3State extends State<DemoTaskDoneScreen3> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF25AAE2));
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
        backgroundColor: Color(0xFF25AAE2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 230,
              child: Image.asset('images/emptyScreen1/taskDone3.png'),
              decoration: BoxDecoration(color: Color(0xFF23A4DB), shape: BoxShape.circle),
            ),
            80.height,
            Text('Task Done!', style: boldTextStyle(size: 20, color: white)),
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
