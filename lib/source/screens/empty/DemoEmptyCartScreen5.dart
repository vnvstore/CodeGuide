import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoEmptyCartScreen5 extends StatefulWidget {
  const DemoEmptyCartScreen5({Key? key}) : super(key: key);

  @override
  _DemoEmptyCartScreen5State createState() => _DemoEmptyCartScreen5State();
}

class _DemoEmptyCartScreen5State extends State<DemoEmptyCartScreen5> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF58968));
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
        backgroundColor: Color(0xFFF58968),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 230, decoration: BoxDecoration(color: Color(0xFFF17650), shape: BoxShape.circle)),
                Positioned(top: -40, child: Image.asset('images/emptyScreen1/emptyCart5.png', height: 250)),
              ],
            ),
            80.height,
            Text('Empty Cart', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
          ],
        ),
      ),
    );
  }
}
