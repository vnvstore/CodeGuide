import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoBalanceScreen3 extends StatefulWidget {
  const DemoNoBalanceScreen3({Key? key}) : super(key: key);

  @override
  _DemoNoBalanceScreen3State createState() => _DemoNoBalanceScreen3State();
}

class _DemoNoBalanceScreen3State extends State<DemoNoBalanceScreen3> {
  @override
  void dispose() {
    setStatusBarColor(Color(0xFFEBF2F7));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            70.height,
            Text('No Balance!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF2D3E5E),
              onTap: () {
                toast('Start Top Up');
              },
              child: Text(
                'Start Top Up',
                style: boldTextStyle(color: white),
              ).paddingSymmetric(horizontal: 32),
            ),
            60.height,
            Image.asset('images/emptyScreen1/noBalance3.png', height: 300),
          ],
        ),
      ),
    );
  }
}
