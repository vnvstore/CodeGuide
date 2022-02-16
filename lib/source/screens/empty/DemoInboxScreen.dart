import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoInboxScreen extends StatefulWidget {
  const DemoInboxScreen({Key? key}) : super(key: key);

  @override
  _DemoInboxScreenState createState() => _DemoInboxScreenState();
}

class _DemoInboxScreenState extends State<DemoInboxScreen> {
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
              padding: EdgeInsets.all(30),
              height: 230,
              decoration: BoxDecoration(color: Color(0xFF23A2D9), shape: BoxShape.circle),
              child: Image.asset('images/emptyScreen1/mailIn.png'),
            ),
            48.height,
            Text('Inbox', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, color: Colors.blue, size: 30),
              backgroundColor: white,
              onPressed: () {
                toast('Add Mail');
              },
            ),
          ],
        ),
      ),
    );
  }
}
