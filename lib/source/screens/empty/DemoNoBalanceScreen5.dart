import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoBalanceScreen5 extends StatefulWidget {
  const DemoNoBalanceScreen5({Key? key}) : super(key: key);

  @override
  _DemoNoBalanceScreen5State createState() => _DemoNoBalanceScreen5State();
}

class _DemoNoBalanceScreen5State extends State<DemoNoBalanceScreen5> {
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
            Container(
              height: 230,
              padding: EdgeInsets.all(40),
              child: Image.asset('images/emptyScreen1/noBalance5.png'),
              decoration: BoxDecoration(color: Color(0xFFF17650), shape: BoxShape.circle),
            ),
            40.height,
            Text('No Balance!', style: boldTextStyle(size: 20, color: white)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: white),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              onPressed: () {
                toast('Add Balance');
              },
              backgroundColor: white,
              child: Icon(Icons.add, size: 30, color: Colors.lightBlue),
            ),
          ],
        ),
      ),
    );
  }
}
