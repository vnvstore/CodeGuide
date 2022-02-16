import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoConnectionFailedScreen extends StatefulWidget {
  const DemoConnectionFailedScreen({Key? key}) : super(key: key);

  @override
  _DemoConnectionFailedScreenState createState() => _DemoConnectionFailedScreenState();
}

class _DemoConnectionFailedScreenState extends State<DemoConnectionFailedScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFDEE0E8));
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
            Image.asset('images/errorScreens/19_Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Connection Failed', style: boldTextStyle(size: 30, color: Colors.black54)),
                16.height,
                Text(
                  'Could not connect to the network, Please check & retry again.',
                  style: primaryTextStyle(size: 18, color: Colors.black45),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('RETRY', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: Color(0xFF5ECB42),
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
