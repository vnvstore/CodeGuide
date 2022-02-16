import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoOppsHomeScreen extends StatefulWidget {
  const DemoOppsHomeScreen({Key? key}) : super(key: key);

  @override
  _DemoOppsHomeScreenState createState() => _DemoOppsHomeScreenState();
}

class _DemoOppsHomeScreenState extends State<DemoOppsHomeScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF302D43));
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
          alignment: Alignment.topCenter,
          children: [
            Image.asset('images/errorScreens/4_File Not Found.png', height: context.height(), fit: BoxFit.cover),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Opps!..', style: secondaryTextStyle(color: white, size: 40)),
                32.height,
                Text(
                  'Looks like the file you are looking for is missing...',
                  style: primaryTextStyle(color: Colors.grey, size: 18),
                ),
                48.height,
                AppButton(
                  child: Text('HOME', style: boldTextStyle()),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 30,
                  color: white,
                  onTap: () {
                    toast('HOME');
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
