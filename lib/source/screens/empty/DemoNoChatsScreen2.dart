import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoChatsScreen2 extends StatefulWidget {
  const DemoNoChatsScreen2({Key? key}) : super(key: key);

  @override
  _DemoNoChatsScreen2State createState() => _DemoNoChatsScreen2State();
}

class _DemoNoChatsScreen2State extends State<DemoNoChatsScreen2> {
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
            Image.asset(
              'images/emptyScreen1/noChats2.png',
              height: 300,
            ),
            32.height,
            Text('No Chats !', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFFEF5959),
              elevation: 10,
              onTap: () {
                toast('Start Chat');
              },
              child: Text('Start Chat', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
            ),
          ],
        ),
      ),
    );
  }
}
