import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoChatsScreen extends StatefulWidget {
  const DemoNoChatsScreen({Key? key}) : super(key: key);

  @override
  _DemoNoChatsScreenState createState() => _DemoNoChatsScreenState();
}

class _DemoNoChatsScreenState extends State<DemoNoChatsScreen> {
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
            Image.asset('images/emptyScreen1/noChats.png', height: 300),
            32.height,
            Text('No Chats !', style: boldTextStyle(size: 20)),
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
