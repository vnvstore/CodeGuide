import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/SemiCircleClipper.dart';

class DemoNoEventScreen3 extends StatefulWidget {
  const DemoNoEventScreen3({Key? key}) : super(key: key);

  @override
  _DemoNoEventScreen3State createState() => _DemoNoEventScreen3State();
}

class _DemoNoEventScreen3State extends State<DemoNoEventScreen3> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFEEF1FA));
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: SemiCircleClipper(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: context.height() * 0.4,
                    decoration: BoxDecoration(color: Color(0xFFEEF1FA)),
                  ),
                  Image.asset('images/emptyScreen1/noEvent3.png', height: 250),
                ],
              ),
            ),
            50.height,
            Text('No Event', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15, color: Colors.blueGrey),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            50.height,
            AppButton(
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
              color: Color(0xFF5B98F3),
              elevation: 10,
              onTap: () {
                toast('Add Event');
              },
              child: Text('Add Event', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
            ),
            50.height,
          ],
        ),
      ),
    );
  }
}
