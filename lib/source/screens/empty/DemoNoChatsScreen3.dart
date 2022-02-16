import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoChatsScreen3 extends StatefulWidget {
  const DemoNoChatsScreen3({Key? key}) : super(key: key);

  @override
  _DemoNoChatsScreen3State createState() => _DemoNoChatsScreen3State();
}

class _DemoNoChatsScreen3State extends State<DemoNoChatsScreen3> {
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
            Image.asset('images/emptyScreen1/noChats3.png', height: 200),
            80.height,
            Text('No Chats!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, size: 30, color: Colors.white),
              backgroundColor: Color(0xFF2D3E5E),
              onPressed: () {
                toast('Start Chat');
              },
            ),
          ],
        ),
      ),
    );
  }
}
