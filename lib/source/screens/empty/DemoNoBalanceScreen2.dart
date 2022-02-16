import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoBalanceScreen2 extends StatefulWidget {
  const DemoNoBalanceScreen2({Key? key}) : super(key: key);

  @override
  _DemoNoBalanceScreen2State createState() => _DemoNoBalanceScreen2State();
}

class _DemoNoBalanceScreen2State extends State<DemoNoBalanceScreen2> {
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
              child: Image.asset('images/emptyScreen1/noBalance2.png'),
              decoration: BoxDecoration(color: grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
            70.height,
            Text('No Balance!', style: boldTextStyle(size: 20)),
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
