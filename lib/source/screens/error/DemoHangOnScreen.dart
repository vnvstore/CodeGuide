import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoHangOnScreen extends StatefulWidget {
  const DemoHangOnScreen({Key? key}) : super(key: key);

  @override
  _DemoHangOnScreenState createState() => _DemoHangOnScreenState();
}

class _DemoHangOnScreenState extends State<DemoHangOnScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF44556E));
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
            Image.asset('images/errorScreens/17_Location Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Hang on a sec..', style: secondaryTextStyle(size: 40, color: white)),
                48.height,
                Text('It seems you are in the middle of the ocean.', style: primaryTextStyle(size: 20, color: Colors.white54)),
                48.height,
                AppButton(
                  color: context.cardColor,
                  child: Text('REFRESH', style: boldTextStyle()).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  onTap: () {
                    toast('REFRESH');
                  },
                ),
                48.height,
              ],
            ).paddingAll(32),
          ],
        ),
      ),
    );
  }
}
