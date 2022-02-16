import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/SemiCircleClipper.dart';

class DemoNoBalanceScreen4 extends StatefulWidget {
  const DemoNoBalanceScreen4({Key? key}) : super(key: key);

  @override
  _DemoNoBalanceScreen4State createState() => _DemoNoBalanceScreen4State();
}

class _DemoNoBalanceScreen4State extends State<DemoNoBalanceScreen4> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFF5BF56));
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
        body: Container(
          height: context.height(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: SemiCircleClipper(),
                child: Container(
                  height: context.height() * 0.4,
                  decoration: BoxDecoration(color: Color(0xFFF5BF56)),
                ),
              ),
              Positioned(
                top: 160,
                child: Image.asset('images/emptyScreen1/noBalance4.png', height: 300),
              ),
              Positioned(
                bottom: 80,
                left: 16,
                right: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('No Balance!', style: boldTextStyle(size: 20)),
                    16.height,
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: secondaryTextStyle(size: 15),
                      textAlign: TextAlign.center,
                    ).paddingSymmetric(vertical: 8, horizontal: 60),
                    60.height,
                    FloatingActionButton(
                      onPressed: () {
                        toast('Add Balance');
                      },
                      backgroundColor: Color(0xFF2D3E5E),
                      child: Icon(Icons.add, size: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
