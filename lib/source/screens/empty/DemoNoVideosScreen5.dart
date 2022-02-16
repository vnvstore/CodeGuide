import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoVideosScreen5 extends StatefulWidget {
  const DemoNoVideosScreen5({Key? key}) : super(key: key);

  @override
  _DemoNoVideosScreen5State createState() => _DemoNoVideosScreen5State();
}

class _DemoNoVideosScreen5State extends State<DemoNoVideosScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF1AB5E5));
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
        backgroundColor: Color(0xFF1AB5E5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(color: Color(0xFF0AA1D0), shape: BoxShape.circle),
                ),
                Image.asset('images/emptyScreen1/noVideo5.png', height: 150),
              ],
            ),
            80.height,
            Text('No Videos!', style: boldTextStyle(size: 20, color: white)),
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
