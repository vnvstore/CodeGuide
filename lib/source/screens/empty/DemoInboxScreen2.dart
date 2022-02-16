import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoInboxScreen2 extends StatefulWidget {
  const DemoInboxScreen2({Key? key}) : super(key: key);

  @override
  _DemoInboxScreen2State createState() => _DemoInboxScreen2State();
}

class _DemoInboxScreen2State extends State<DemoInboxScreen2> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                60.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Inbox', style: boldTextStyle(size: 20), textAlign: TextAlign.start),
                    Text('You have no mail', style: primaryTextStyle(size: 15), textAlign: TextAlign.start),
                  ],
                ).expand(),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ).paddingOnly(left: 8, right: 8, top: 16),
            SizedBox(height: context.height() * 0.2),
            Container(
              height: 350,
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/inbox.png'),
              decoration: BoxDecoration(color: lightGray.withOpacity(0.5), shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
