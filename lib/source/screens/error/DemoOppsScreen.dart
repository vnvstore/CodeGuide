import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoOppsScreen extends StatefulWidget {
  const DemoOppsScreen({Key? key}) : super(key: key);

  @override
  _DemoOppsScreenState createState() => _DemoOppsScreenState();
}

class _DemoOppsScreenState extends State<DemoOppsScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF5545B7));
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
            Image.asset('images/errorScreens/1_No Connection.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Opps!..', style: secondaryTextStyle(color: white, size: 40)),
                32.height,
                Text(
                  'Something wrong with your connection, Please try again.',
                  style: primaryTextStyle(color: Colors.white54, size: 18),
                ).paddingAll(8),
                32.height,
                AppButton(
                  color: context.cardColor,
                  child: Text('RETRY', style: boldTextStyle()),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 30,
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
