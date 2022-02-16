import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoVideosScreen4 extends StatefulWidget {
  const DemoNoVideosScreen4({Key? key}) : super(key: key);

  @override
  _DemoNoVideosScreen4State createState() => _DemoNoVideosScreen4State();
}

class _DemoNoVideosScreen4State extends State<DemoNoVideosScreen4> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3981EC));
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
        backgroundColor: Color(0xFF3981EC),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(color: Color(0xFF2471E5), shape: BoxShape.circle),
                ),
                Image.asset('images/emptyScreen1/noVideo4.png', height: 150),
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
