import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoChatsScreen4 extends StatefulWidget {
  const DemoNoChatsScreen4({Key? key}) : super(key: key);

  @override
  _DemoNoChatsScreen4State createState() => _DemoNoChatsScreen4State();
}

class _DemoNoChatsScreen4State extends State<DemoNoChatsScreen4> {
  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF2D3E5E),
          onPressed: () {
            toast('Start Chat');
          },
          child: Icon(Icons.message, color: Colors.white),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/emptyScreen1/noChats4.png', height: 250),
            48.height,
            Text('No Chats!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 40),
          ],
        ),
      ),
    );
  }
}
