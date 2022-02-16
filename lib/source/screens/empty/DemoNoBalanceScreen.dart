import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoBalanceScreen extends StatefulWidget {
  const DemoNoBalanceScreen({Key? key}) : super(key: key);

  @override
  _DemoNoBalanceScreenState createState() => _DemoNoBalanceScreenState();
}

class _DemoNoBalanceScreenState extends State<DemoNoBalanceScreen> {
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
            Container(
              height: 230,
              padding: EdgeInsets.all(40),
              child: Image.asset('images/emptyScreen1/noBalance1.png'),
              decoration: BoxDecoration(color: grey.withOpacity(0.2), shape: BoxShape.circle),
            ),
            70.height,
            Text('No Balance!', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: secondaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            36.height,
            FloatingActionButton(
              backgroundColor: Color(0xFF2D3E5E),
              child: Icon(Icons.add, size: 30, color: Colors.white),
              onPressed: () {
                toast('Add Balance');
              },
            ),
          ],
        ),
      ),
    );
  }
}
