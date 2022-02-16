import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoTaskDoneScreen2 extends StatefulWidget {
  const DemoTaskDoneScreen2({Key? key}) : super(key: key);

  @override
  _DemoTaskDoneScreen2State createState() => _DemoTaskDoneScreen2State();
}

class _DemoTaskDoneScreen2State extends State<DemoTaskDoneScreen2> {
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
            Image.asset('images/emptyScreen1/taskDone2.png', height: 220),
            48.height,
            Text('Task Done!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: Colors.black54),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF2D3E5E),
              elevation: 10,
              onTap: () {
                toast('Button');
              },
              child: Text('Button', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
            ),
          ],
        ),
      ),
    );
  }
}
