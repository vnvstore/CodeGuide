import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoRouterOfflineScreen extends StatefulWidget {
  const DemoRouterOfflineScreen({Key? key}) : super(key: key);

  @override
  _DemoRouterOfflineScreenState createState() => _DemoRouterOfflineScreenState();
}

class _DemoRouterOfflineScreenState extends State<DemoRouterOfflineScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFC1B4A1));
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
            Image.asset('images/errorScreens/18_Router Offline.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Router Offline', style: boldTextStyle(size: 30)),
                16.height,
                Text(
                  'No internet connection, please try restarting your router...',
                  style: primaryTextStyle(size: 18, color: Colors.black45),
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
