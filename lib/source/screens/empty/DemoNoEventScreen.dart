import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils

class DemoNoEventScreen extends StatefulWidget {
  const DemoNoEventScreen({Key? key}) : super(key: key);

  @override
  _DemoNoEventScreenState createState() => _DemoNoEventScreenState();
}

class _DemoNoEventScreenState extends State<DemoNoEventScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFFEDD96));
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
              clipper: WaveClipper(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: context.height() * 0.45,
                    decoration: BoxDecoration(color: Color(0xFFFEDD96)),
                  ),
                  Image.asset('images/emptyScreen1/noEvent1.png', height: 250),
                ],
              ),
            ),
            32.height,
            Text('No Event', style: boldTextStyle(size: 20)),
            16.height,
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: primaryTextStyle(size: 15),
              textAlign: TextAlign.center,
            ).paddingSymmetric(vertical: 8, horizontal: 60),
            32.height,
            FloatingActionButton(
              child: Icon(Icons.add, size: 30),
              onPressed: () {
                toast('Add Event');
              },
            ),
            60.height,
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, size.height - 50, size.width / 2, size.height - 30);
    path.quadraticBezierTo(3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
