import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DemoCameraAccessScreen extends StatefulWidget {
  const DemoCameraAccessScreen({Key? key}) : super(key: key);

  @override
  _DemoCameraAccessScreenState createState() => _DemoCameraAccessScreenState();
}

class _DemoCameraAccessScreenState extends State<DemoCameraAccessScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF8F9FB));
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
            Image.asset('images/errorScreens/21_No Camera Access.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Camera Access', style: boldTextStyle(size: 30)),
                16.height,
                Text(
                  'Please allow access to your camera to take photos.',
                  style: primaryTextStyle(size: 18),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('ALLOW', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  elevation: 20,
                  padding: EdgeInsets.all(16),
                  color: Color(0xFFEA62CC),
                  onTap: () {
                    toast('ALLOW');
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
