import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoErrorScreen extends StatefulWidget {
  const DemoErrorScreen({Key? key}) : super(key: key);

  @override
  _DemoErrorScreenState createState() => _DemoErrorScreenState();
}

class _DemoErrorScreenState extends State<DemoErrorScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF9FAFB));
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
            Image.asset('images/errorScreens/7_Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Error!', style: boldTextStyle(size: 30, color: Colors.black)),
                16.height,
                Text(
                  'Something went wrong, Please try again later',
                  style: primaryTextStyle(size: 18, color: Colors.black54),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('RETRY', style: boldTextStyle()).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: context.cardColor,
                  elevation: 10,
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('RETRY');
                  },
                ),
                100.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
