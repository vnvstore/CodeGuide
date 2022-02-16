import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoDeadEndScreen extends StatefulWidget {
  const DemoDeadEndScreen({Key? key}) : super(key: key);

  @override
  _DemoDeadEndScreenState createState() => _DemoDeadEndScreenState();
}

class _DemoDeadEndScreenState extends State<DemoDeadEndScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3BC3A4));
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
            Image.asset(
              'images/errorScreens/8_404 Error.png',
              fit: BoxFit.cover,
              height: context.height(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Dead End', style: primaryTextStyle(size: 40, color: white)),
                32.height,
                Text(
                  'Opps! The page you are looking for doesn\'t exist...',
                  style: primaryTextStyle(color: Colors.white60, size: 18),
                ),
                48.height,
                AppButton(
                  child: Text('HOME', style: boldTextStyle()),
                  color: context.cardColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 10,
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
