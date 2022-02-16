import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoEventScreen2 extends StatefulWidget {
  const DemoNoEventScreen2({Key? key}) : super(key: key);

  @override
  _DemoNoEventScreen2State createState() => _DemoNoEventScreen2State();
}

class _DemoNoEventScreen2State extends State<DemoNoEventScreen2> {
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
              height: 230,
              child: Image.asset('images/emptyScreen1/noEvent2.png'),
              decoration: BoxDecoration(color: grey.withOpacity(0.1), shape: BoxShape.circle),
            ),
            70.height,
            Text('No Event', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, size: 30),
              onPressed: () {
                toast('Add Event');
              },
            ),
          ],
        ),
      ),
    );
  }
}
