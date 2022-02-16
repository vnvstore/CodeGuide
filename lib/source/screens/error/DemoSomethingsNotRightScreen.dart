import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoSomethingsNotRightScreen extends StatefulWidget {
  const DemoSomethingsNotRightScreen({Key? key}) : super(key: key);

  @override
  _DemoSomethingsNotRightScreenState createState() => _DemoSomethingsNotRightScreenState();
}

class _DemoSomethingsNotRightScreenState extends State<DemoSomethingsNotRightScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFE0E2ED));
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
        body: Stack(
          children: [
            Image.asset('images/errorScreens/16_Time Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Something\'s Not Right..', style: boldTextStyle(size: 30, color: Colors.black)),
                32.height,
                Text('Please check the status of your device and retry', style: primaryTextStyle(size: 18, color: Colors.blueGrey)),
                48.height,
                AppButton(
                  child: Text('RETRY', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 16),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: Color(0xFF40588B),
                  onTap: () {
                    toast('RETRY');
                  },
                ),
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
