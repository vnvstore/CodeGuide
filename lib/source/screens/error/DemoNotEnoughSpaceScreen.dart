import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoNotEnoughSpaceScreen extends StatefulWidget {
  const DemoNotEnoughSpaceScreen({Key? key}) : super(key: key);

  @override
  _DemoNotEnoughSpaceScreenState createState() => _DemoNotEnoughSpaceScreenState();
}

class _DemoNotEnoughSpaceScreenState extends State<DemoNotEnoughSpaceScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF1F3F5));
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
            Image.asset('images/errorScreens/13_Storage Not Enough.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Not Enough Space', style: boldTextStyle(size: 20,color: Colors.black)),
                32.height,
                Text(
                  'You do not have enough storage left to save this file...',
                  style: primaryTextStyle(size: 20, color: Colors.blueGrey),
                ).paddingSymmetric(vertical: 8, horizontal: 8),
                32.height,
                AppButton(
                  child: Text('MANAGE', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 8),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: Color(0xFF40588B),
                  onTap: () {
                    toast('MANAGE');
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
