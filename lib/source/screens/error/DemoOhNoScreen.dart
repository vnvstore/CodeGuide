import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoOhNoScreen extends StatefulWidget {
  @override
  _DemoOhNoScreenState createState() => _DemoOhNoScreenState();
}

class _DemoOhNoScreenState extends State<DemoOhNoScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFFFFFF));
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
            Image.asset('images/errorScreens/3_Something Went Wrong.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Oh no!', style: boldTextStyle(size: 25)),
                16.height,
                Text(
                  'Something went wrong, Please try again.',
                  style: secondaryTextStyle(size: 18, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('TRY AGAIN', style: boldTextStyle(color: white)),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: Color(0xE91ED245),
                  onTap: () {
                    toast('TRY AGAIN');
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
