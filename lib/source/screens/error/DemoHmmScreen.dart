import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoHmmScreen extends StatefulWidget {
  const DemoHmmScreen({Key? key}) : super(key: key);

  @override
  _DemoHmmScreenState createState() => _DemoHmmScreenState();
}

class _DemoHmmScreenState extends State<DemoHmmScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFFB771));
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
            Image.asset('images/errorScreens/6_Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Hmmm..', style: primaryTextStyle(size: 40, color: white)),
                32.height,
                Text(
                  'Something is wrong here...\n We\'ll fix it soon!',
                  style: primaryTextStyle(color: Colors.white54, size: 18),
                ),
                48.height,
                AppButton(
                  color:context.cardColor,
                  child: Text('HOME', style: boldTextStyle()).paddingSymmetric(horizontal: 32),
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
