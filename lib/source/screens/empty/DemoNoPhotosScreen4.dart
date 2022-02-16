import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/SemiCircleClipper.dart';

class DemoNoPhotosScreen4 extends StatefulWidget {
  const DemoNoPhotosScreen4({Key? key}) : super(key: key);

  @override
  _DemoNoPhotosScreen4State createState() => _DemoNoPhotosScreen4State();
}

class _DemoNoPhotosScreen4State extends State<DemoNoPhotosScreen4> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFF3981EC));
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
        body: SingleChildScrollView(
          child:  Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: SemiCircleClipper(),
                    child: Stack(
                      children: [
                        Container(
                          height: context.height() * 0.5,
                          decoration: BoxDecoration(color: Color(0xFF3981EC)),
                        ),
                        Image.asset('images/emptyScreen1/noPhotos4.png'),
                      ],
                    ),
                  ),
                  70.height,
                  Text('No Photos!', style: boldTextStyle(size: 20)),
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
                      toast('Add Photos');
                    },
                  ),
                  70.height,
                ],
              ),
            ],
          ),
        ),


      ),
    );
  }
}
